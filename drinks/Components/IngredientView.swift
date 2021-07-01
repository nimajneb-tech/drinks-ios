//
//  IngredientView.swift
//  drinks
//
//  Created by Benjamin on 29/06/2021.
//

import Foundation
import UIKit

class IngredientView: UIView {
    
    //MARK: - Internal variables
    private let ingredientsHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.alpha = 0.7
        label.text = "Ingredients"
        
        return label
    }()
    
    private let ingredientStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let measureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
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
        
        self.addSubview(self.ingredientsHeader)
        self.ingredientsHeader.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(10)
        }
        
        self.stackContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.ingredientsHeader.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
        }
        
        self.stackContainerView.addSubview(self.ingredientStackView)
        self.ingredientStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().inset(10)
        }
        
        self.stackContainerView.addSubview(self.measureStackView)
        self.measureStackView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(15)
            make.top.equalTo(self.ingredientStackView.snp.top)
        }
        
        if let _drink = self.drink {
            for ingredient in _drink.getAllIngredients() {
                let label = UILabel()
                label.text = ingredient
                label.textColor = .darkGray
                label.textAlignment = .left
                label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
                
                self.ingredientStackView.addArrangedSubview(label)
            }
            
            for measure in _drink.getAllMeasures() {
                let label = UILabel()
                label.text = measure
                label.textColor = .lightGray
                label.textAlignment = .right
                
                self.measureStackView.addArrangedSubview(label)
            }
        }
    }
}
