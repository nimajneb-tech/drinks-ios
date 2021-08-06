//
//  CacheManager.swift
//  drinks
//
//  Created by Benjamin on 04/08/2021.
//

import Foundation

struct CacheKeys {
    static let drinkId: String = "drinkIds"
}

class CacheManager {
    
    static let shared = CacheManager()
    private let userDefaults = UserDefaults.standard
    
    func getFavoriteDrinks() -> [String] {
        let arrayOfDrinks = userDefaults.stringArray(forKey: CacheKeys.drinkId) ?? [String]()
        
        return arrayOfDrinks
    }
    
    func setFavoriteDrink(drinkId: String) {
        var arrayOfDrinks = userDefaults.stringArray(forKey: CacheKeys.drinkId) ?? [String]()
        if let index = arrayOfDrinks.firstIndex(of: drinkId) {
            arrayOfDrinks.remove(at: index)
        } else {
            arrayOfDrinks.append(drinkId)
        }
        
        userDefaults.setValue(arrayOfDrinks, forKey: CacheKeys.drinkId)
    }
}
