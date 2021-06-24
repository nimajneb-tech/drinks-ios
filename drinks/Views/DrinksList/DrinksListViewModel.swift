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
    
    init(repository: DataRepository) {
        super.init()
        self.repository = repository
        self.fetchPopularDrinks()
    }
    
    func fetchPopularDrinks() {
        self.repository.getPopularDrinks().subscribe(onNext: { (drinks) in
            self.drinks = drinks
        }, onError: { (error) in
        }).disposed(by: self.disposeBag)
    }
}
