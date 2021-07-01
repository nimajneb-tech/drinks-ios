//
//  InstructionsView.swift
//  drinks
//
//  Created by Benjamin on 30/06/2021.
//

import Foundation
import UIKit

class InstructionsView: UIView {
    
    //MARK: - Internal variables
    private let instructionsHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.alpha = 0.7
        label.text = "Instructions"
        
        return label
    }()
    
    private let stackContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 3
        
        return view
    }()
    
    private var instructions: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkGray
        label.numberOfLines = 0
        
        return label
    }()
    
    private var drink: Drink?
    
    //MARK: - Initialize
    init(drink: Drink?) {
        super.init(frame: CGRect())
        self.drink = drink
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    /// create UI and setup constraints
    func setupView() {
        self.addSubview(self.stackContainerView)
        
        self.addSubview(self.instructionsHeader)
        self.instructionsHeader.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(10)
        }
        
        self.stackContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.instructionsHeader.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
        }
        
        self.stackContainerView.addSubview(self.instructions)
        self.instructions.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
        if let _drink = self.drink {
            self.instructions.text = _drink.strInstructions.replacingOccurrences(of: ". ", with: ".\n")
        }
    }
}
