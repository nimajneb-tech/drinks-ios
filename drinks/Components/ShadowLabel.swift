//
//  ShadowLabel.swift
//  drinks
//
//  Created by Benjamin on 25/06/2021.
//

import Foundation
import UIKit

class ShadowLabel: UILabel {
    
    init() {
        super.init(frame: CGRect.zero)
        self.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.textColor = .white
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
