//
//  DataRepositoryRequest.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation
import Alamofire

/// Data Repository Request
///
/// T must conformt to both `Object` and `Codable` for caching and data decoding purposes.
struct DataRepositoryRequest<T: Codable> {
    /// The HTTP method to use. The reuqest will be executed  using this method in Alamofire
    var method: HTTPMethod = .get
    
    /// Endpoint to call. Only add path, as in `/user` and not the full url
    var endpoint: String
    
    /// Parameters to be send as json
    var params: [String: Any]?
    
    /// If the request requires user authorization
    var authorizationNeeded: Bool = true
    
    /// When data is provided we upload instead
    var multipartData: Alamofire.MultipartFormData?
}

protocol DataRepositoryAuthorizationEntity {
    var token: String { get set }
}
