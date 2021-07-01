//
//  DrinksDetailViewModel.swift
//  drinks
//
//  Created by Benjamin on 25/06/2021.
//

import Foundation
import RxSwift

class DrinksDetailViewModel: NSObject {
    
    var drink: Drink?
    
    //MARK: - Variables to be used in the controller
    var displayDrinkName: String {
        if let _drink = drink {
            return _drink.strDrink
        }
        return ""
    }
    
    var thumbUrl: URL {
        if let _drink = drink {
            if let url = URL(string: _drink.strDrinkThumb) {
                return url
            }
        }
        return URL(string: "")!
    }
    
    //MARK: - Initialize
    init(drink: Drink) {
        super.init()
        self.drink = drink
    }
    
    //MARK: - Functions for controller
    func loadVideo() -> URLRequest? {
        if let _drink = self.drink {
            if let videoString = _drink.strVideo {
                let embeddedString = videoString.components(separatedBy: "v=")[1]
                if let videoUrl = URL(string: "https://www.youtube.com/embed/" + embeddedString) {
                    return URLRequest(url: videoUrl)
                }
            }
        }
        return nil
    }
}
