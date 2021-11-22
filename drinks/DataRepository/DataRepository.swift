//
//  DataRepository.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation
import Alamofire
import RxCocoa
import RxSwift

/// Data Repository
///
/// The main data repository that handles fetching and storing of the API
///

class DataRepository {
    
    /// Some standard errors
    enum Error: Swift.Error {
        case notSupportedWhenOffline
        case cacheCorrupted
        case authorizationMissing
    }
    
    /// Rx Dispose bag
    var disposeBag = DisposeBag()
    
    /// The repository base URL
    private var baseUrl: String
    
    /// The repository api key (used in every request)
    private var apiKey: String
    
    /// Reachabitlity class to listen for network changes
    private var network: NetworkReachabilityManager
    
    /// If we are connected to network or not
    var isConnected: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: true)
    
    /// The UUID of the device
    var uuid: String {
        let defaults = UserDefaults.standard
        if let uuid = defaults.string(forKey: "uuid") {
            return uuid
        }
        
        // Generate uuid
        let uuid = UUID()
        defaults.set(uuid.uuidString, forKey: "uuid")
        defaults.synchronize()
        
        return uuid.uuidString
    }
    
    /// Init with base URL
    /// Sets up network listener
    init(baseUrl: String, apiKey: String) {
        self.baseUrl = baseUrl
        self.apiKey = apiKey
        
        self.network = NetworkReachabilityManager(host: "www.apple.com")!
        self.isConnected.accept(self.network.status != .notReachable && self.network.status != .unknown)
        self.network.startListening { [unowned self] (status) in
            self.isConnected.accept(status != .notReachable && status != .unknown)
        }
    }
    
    /// Stops network listener
    deinit {
        self.network.stopListening()
    }
    
    /// Perform request
    ///
    /// Performs a network request using a `DataRepositoryRequest` struct. When request completes the result will be
    /// stored in the database for later use.
    ///
    
    func performRequest<T>(_ request: DataRepositoryRequest<T>) -> Observable<[T]> where T: Codable {
        return Observable.create { (observable) -> Disposable in
            
            if !self.isConnected.value {
                if request.method != .get {
                    observable.onError(Error.notSupportedWhenOffline)
                } else {
                    
                    let objects = [T]()
                    
                    observable.onNext(objects)
                    observable.onCompleted()
                }
            }
            else {
                self.buildRequest(request: request)
                    .validate(statusCode: 200..<500)
                    .response { (alamoResponse) in
                        switch(alamoResponse.result)
                        {
                        case .failure(let error):
                            if let data = alamoResponse.data {
                                if let decodedObject = try? JSONDecoder().decode(ApiError.self, from: data) {
                                    observable.onError(decodedObject)
                                    return
                                }
                            }
                            
                            observable.onError(error)
                            break
                        case .success(let value):
                            do {
                                var objects = [T]()
                                
                                let decoder = JSONDecoder()
                                
                                if let decodedObjects = try? decoder.decode([T].self, from: value!) {
                                    objects = decodedObjects
                                }
                                
                                if let decodedObject = try? decoder.decode(T.self, from: value!) {
                                    objects = [decodedObject]
                                }
                                
                                observable.onNext(objects)
                                observable.onCompleted()
                            }
                            break
                        }
                    }
            }
            
            return Disposables.create()
        }
    }
    
    private func buildRequest<T>(request: DataRepositoryRequest<T>) -> DataRequest where T: Codable {
        
        let url = "\(self.baseUrl)/\(request.endpoint)"
        
        var headers = HTTPHeaders()
        
        headers = [
            "x-rapidapi-key": self.apiKey,
            "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com"
        ]
        
        if let multipart = request.multipartData {
            return AF.upload(multipartFormData: multipart,
                             to: url,
                             usingThreshold: MultipartFormData.encodingMemoryThreshold,
                             method: request.method,
                             headers: headers)
        } else {
            return  AF.request(url,
                               method: request.method,
                               parameters: request.params,
                               encoding: URLEncoding.default,
                               headers: headers)
        }
    }
}

