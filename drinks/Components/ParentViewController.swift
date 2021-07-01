//
//  ParentViewController.swift
//  drinks
//
//  Created by Benjamin on 26/06/2021.
//

import Foundation
import UIKit

class ParentViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradientBackground()
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
