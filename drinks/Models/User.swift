//
//  User.swift
//  drinks
//
//  Created by Benjamin on 04/08/2021.
//

import Foundation

class User: NSObject, NSCoding {
    
    var favoriteDrinks: [String] = [] { didSet { save() }}
    let userDefaults = UserDefaults.standard
    
    func getFavoriteDrinks() -> [String] {
        let arrayOfDrinks = userDefaults.stringArray(forKey: CacheKeys.drinkId) ?? [String]()
        
        return arrayOfDrinks
    }
    
    func setFavoriteDrink(drinkId: String) {
        var arrayOfDrinks = userDefaults.stringArray(forKey: CacheKeys.drinkId) ?? [String]()
        arrayOfDrinks.append(drinkId)
        userDefaults.setValue(arrayOfDrinks, forKey: CacheKeys.drinkId)
    }
    
    override init() { }
    required init?(coder: NSCoder) {
        self.favoriteDrinks = coder.decodeObject(forKey: CacheKeys.drinkId) as? [String] ?? []
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(favoriteDrinks, forKey: CacheKeys.drinkId)
    }
    
    private func save() {
        CacheManager.shared.user = self
    }
}
