//
//  DrinksRepository.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation
import RxSwift

protocol DrinksRepository {
    func getPopularDrinks() -> Observable<[Drink]>
}

extension DataRepository: DrinksRepository {
    func getPopularDrinks() -> Observable<[Drink]> {
    
        let request = DataRepositoryRequest<Drink>(method: .get,
                                                      endpoint: "https://the-cocktail-db.p.rapidapi.com/popular.php",
                                                      params: nil,
                                                      authorizationNeeded: true)
        
        return self.performRequest(request)
    }
}
