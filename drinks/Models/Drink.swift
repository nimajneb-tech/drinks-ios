//
//  Drink.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation

// MARK: - Drink
struct Drink: Codable {
    let idDrink, strDrink: String
    let strTags: String
    let strVideo: String
    let strCategory, strIBA, strAlcoholic, strGlass: String
    let strInstructions: String
    let strDrinkThumb: String
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6: String
    let strIngredient7, strIngredient8, strIngredient9, strIngredient10: String?
    let strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8: String
    let strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15: String
    let strImageSource: String
    let strImageAttribution, strCreativeCommonsConfirmed, dateModified: String

    enum CodingKeys: String, CodingKey {
        case idDrink, strDrink, strTags, strVideo, strCategory, strIBA, strAlcoholic, strGlass, strInstructions, strDrinkThumb, strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strImageSource, strImageAttribution, strCreativeCommonsConfirmed, dateModified
    }
}


