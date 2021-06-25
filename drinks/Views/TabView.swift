//
//  TabView.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation
import UIKit

class TabView: UITabBarController {
   
    var repository: DataRepository!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    init(repository: DataRepository) {
        super.init(nibName: nil, bundle: nil)
        self.repository = repository
        self.setupVCs()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI setup
    private func setupVCs(){
        viewControllers = [
            self.createNavControllers(for: DrinksListViewController(repository: self.repository), title: "Popular", image: UIImage(systemName: "list.dash")!),
            self.createNavControllers(for: DrinksListViewController(repository: self.repository), title: "Latest", image: UIImage(systemName: "list.dash")!)
        ]
    }
    
    fileprivate func createNavControllers(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        
        return navController
    }
}
