//
//  AppCordinator.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation
import UIKit
import RxSwift

/// App Coordinator
/// Coordinates the main app state, ie if you are logged in or not
class AppCordinator {
    
    /// Current App State
    enum AppState {
        case splash
        case app
    }
    
    /// The window where we cordinate the view in
    private var window: UIWindow!
    
    var repository: DataRepository
    
    ///
    init(repository: DataRepository) {
        self.repository = repository
    }
 
    /// Starts the cordinator and sets the app state
    func start(in window: UIWindow) {
        self.window = window
        setRootController(state: .splash)
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] (timer) in
            self?.setRootController(state: .app)
        }
    }
    
    /// Sets a new root view controller on the window
    private func setRootController(state: AppState) {
        
        self.window.rootViewController?.view.removeFromSuperview()
        self.window.rootViewController = nil
        
        switch state {
                case .splash:
                    self.window.rootViewController = UIStoryboard(name: "Splash", bundle: nil).instantiateInitialViewController()
                    break
                case .app:
                    self.window.rootViewController = TabView(repository: self.repository)
                    break
                }
        
        self.window.makeKeyAndVisible()
    }
}
