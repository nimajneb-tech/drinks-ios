//
//  DrinksListViewController.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation
import UIKit
import SnapKit

class DrinksListViewController: UIViewController {
    
    //MARK: - Internal Variables
    private var viewModel: DrinksListViewModel?
    private let cellId = "recipesCell"
    private let drinksTableView = UITableView()
    
    
    init(repository: DataRepository) {
        super.init(nibName: nil, bundle: nil)
        self.bindToViewModel(with: repository)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drinksTableView.delegate = self
        self.drinksTableView.dataSource = self
        
        self.drinksTableView.register(DrinksListCell.self, forCellReuseIdentifier: self.cellId)
    }
    
    //MARK: - Functions
    func bindToViewModel(with repository: DataRepository) {
        self.viewModel = DrinksListViewModel(repository: repository)
        self.viewModel?.bindDrinksListViewModelToController = {
            DispatchQueue.main.async {
                self.drinksTableView.reloadData()
            }
        }
    }
    
    //MARK: - Setup View
    func setupView() {
        self.view.addSubview(self.drinksTableView)
        self.drinksTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - Extensions
extension DrinksListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let drinks = self.viewModel?.drinks {
            return drinks.count
        }
       return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)
        let drink = self.viewModel?.drinks[indexPath.row]
        
        return cell
    }
}

