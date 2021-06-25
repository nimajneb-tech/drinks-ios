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
        
        self.setGradientBackground()
        self.setupTableView()
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
    
    //MARK: - Setup UI
    func setupTableView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.drinksTableView.separatorStyle = .none
        self.drinksTableView.backgroundColor = .clear
        self.drinksTableView.register(DrinksListCell.self, forCellReuseIdentifier: self.cellId)
        self.drinksTableView.delegate = self
        self.drinksTableView.dataSource = self
        self.view.addSubview(self.drinksTableView)
        self.drinksTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}

//MARK: - Extensions
extension DrinksListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let drink = self.viewModel?.drinks[indexPath.section] {
            let viewController = DrinksDetailViewController(drink: drink)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let drinks = self.viewModel?.drinks {
            return drinks.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! DrinksListCell
        
        if let drink = self.viewModel?.drinks[indexPath.section] {
            cell.configureCell(with: drink)
        }
        
        return cell
    }
}

