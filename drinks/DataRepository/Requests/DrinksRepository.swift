//
//  DrinksRepository.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation
import RxSwift

protocol DrinksRepository {
    func getPopularDrinks() -> Observable<EntDrink>
}

extension DataRepository: DrinksRepository {
    
    func getPopularDrinks() -> Observable<EntDrink> {
        let request = DataRepositoryRequest<EntDrink>(method: .get,
                                                        endpoint: "popular.php",
                                                        params: nil,
                                                        authorizationNeeded: true)

        return self.performRequest(request).flatMap { (drink) -> Observable<EntDrink> in
            return Observable<EntDrink>.of(drink.first!)
        }
    }
}
