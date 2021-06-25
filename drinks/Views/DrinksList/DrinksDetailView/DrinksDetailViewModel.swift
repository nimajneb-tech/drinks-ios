//
//  DrinksDetailViewModel.swift
//  drinks
//
//  Created by Benjamin on 25/06/2021.
//

import Foundation


class DrinksDetailViewModel: NSObject {
    
    private(set) var drink: Drink? {
        didSet {
            self.bindDrinkDetailViewModelToController()
        }
    }
    
    var bindDrinkDetailViewModelToController : (() -> ()) = {}
    
}
