//
//  DrinksListViewModel.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation
import RxSwift

class DrinksListViewModel: NSObject {
    
    private var repository: DrinksRepository!
    private var disposeBag = DisposeBag()
    
    private(set) var drinks: [Drink] = []{
        didSet {
            self.bindDrinksListViewModelToController()
        }
    }
    
    var bindDrinksListViewModelToController : (() -> ()) = {}
    
    init(repository: DrinksRepository) {
        super.init()
        self.repository = repository
    }
    
    func fetchPopularDrinks() {
        self.repository.getPopularDrinks().subscribe(onNext: { (allDrinks) in
            self.drinks = allDrinks.drinks
        }, onError: { (error) in
        }).disposed(by: self.disposeBag)
    }
    
    func fetchFavoriteDrinks() {
        self.drinks = []
        for drinkId in CacheManager.shared.getFavoriteDrinks() {
            self.repository.getFavoriteDrink(drinkId: drinkId).subscribe(onNext: { (favoriteDrinks) in
                guard let drink = favoriteDrinks.drinks.first else { return }
                self.drinks.append(drink)
            }, onError: { (error) in
            }).disposed(by: self.disposeBag)
        }
    }
    
    func fetchRandomDrinks() {
        self.repository.getRandomDrinks().subscribe(onNext: { (allDrinks) in
            self.drinks = allDrinks.drinks
        }, onError: { (error) in
        }).disposed(by: self.disposeBag)
    }
}
