//
//  Drink.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation

// MARK: - EntDrink
struct EntDrink: Codable {
    let drinks: [Drink]
}

// MARK: - EntDrinkElement
struct Drink: Codable {
    let strDrink: String
    let strCategory, strAlcoholic, strGlass: String
    let strInstructions: String
    let strDrinkThumb: String
}
