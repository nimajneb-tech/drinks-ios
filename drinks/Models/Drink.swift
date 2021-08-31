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
    
    let idDrink: String
    let strDrink: String
    let strVideo: String?
    let strCategory, strAlcoholic, strGlass: String
    let strInstructions: String
    let strDrinkThumb: String
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10: String?
    
    func getAllIngredients() -> [String] {
        var allIngredients: [String] = []
        
        if let ingredient = self.strIngredient1 {
            if !ingredient.isEmpty {
                allIngredients.append(ingredient)
            }
        }
        
        if let ingredient = self.strIngredient2 {
            if !ingredient.isEmpty {
                allIngredients.append(ingredient)
            }
        }
        
        if let ingredient = self.strIngredient3 {
            if !ingredient.isEmpty {
                allIngredients.append(ingredient)
            }
        }
        
        if let ingredient = self.strIngredient4 {
            if !ingredient.isEmpty {
                allIngredients.append(ingredient)
            }
        }
        
        if let ingredient = self.strIngredient5 {
            if !ingredient.isEmpty {
                allIngredients.append(ingredient)
            }
        }
        
        if let ingredient = self.strIngredient6 {
            if !ingredient.isEmpty {
                allIngredients.append(ingredient)
            }
        }
        
        if let ingredient = self.strIngredient7 {
            if !ingredient.isEmpty {
                allIngredients.append(ingredient)
            }
        }
        
        if let ingredient = self.strIngredient8 {
            if !ingredient.isEmpty {
                allIngredients.append(ingredient)
            }
        }
        
        if let ingredient = self.strIngredient9 {
            if !ingredient.isEmpty {
                allIngredients.append(ingredient)
            }
        }
        
        if let ingredient = self.strIngredient10 {
            if !ingredient.isEmpty {
                allIngredients.append(ingredient)
            }
        }
        
        return allIngredients
    }
    
    func getAllMeasures() -> [String] {
        var allMeasures: [String] = []
        
        if let measure = self.strMeasure1 {
            if !measure.isEmpty {
                allMeasures.append(measure)
            }
        }
        
        if let measure = self.strMeasure2 {
            if !measure.isEmpty {
                allMeasures.append(measure)
            }
        }
        
        if let measure = self.strMeasure3 {
            if !measure.isEmpty {
                allMeasures.append(measure)
            }
        }
        
        if let measure = self.strMeasure4 {
            if !measure.isEmpty {
                allMeasures.append(measure)
            }
        }
        
        if let measure = self.strMeasure5 {
            if !measure.isEmpty {
                allMeasures.append(measure)
            }
        }
        
        if let measure = self.strMeasure6 {
            if !measure.isEmpty {
                allMeasures.append(measure)
            }
        }
        
        if let measure = self.strMeasure7 {
            if !measure.isEmpty {
                allMeasures.append(measure)
            }
        }
        
        if let measure = self.strMeasure8 {
            if !measure.isEmpty {
                allMeasures.append(measure)
            }
        }
        
        if let measure = self.strMeasure9 {
            if !measure.isEmpty {
                allMeasures.append(measure)
            }
        }
        
        if let measure = self.strMeasure10 {
            if !measure.isEmpty {
                allMeasures.append(measure)
            }
        }
        
        return allMeasures
    }
}
