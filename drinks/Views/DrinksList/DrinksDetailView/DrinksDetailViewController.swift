//
//  DrinksDetailViewController.swift
//  drinks
//
//  Created by Benjamin on 25/06/2021.
//

import Foundation
import UIKit
import SnapKit

class DrinksDetailViewController: UIViewController {
    
    //MARK: - Internal Variables
    private var viewModel: DrinksDetailViewModel?
    
    init(drink: Drink) {
        super.init(nibName: nil, bundle: nil)
        self.bindToViewModel(with: drink)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindToViewModel(with drink: Drink) {
        self.viewModel = DrinksDetailViewModel()
    }
    
    //MARK: - Functions
    func setupView(){
        
    }
}
