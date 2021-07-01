//
//  DrinksListCell.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class DrinksListCell: UITableViewCell {
    
    //MARK: - Internal variables
    private let headerTitle: ShadowLabel = {
        let label = ShadowLabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let drinkImage: UIImageView = {
        let imageView = UIImageView()
       imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        
        return imageView
    }()
    
    private let headerSubtitle: ShadowLabel = {
        let label = ShadowLabel()
        
        return label
    }()
    
    private let glassLabel: ShadowLabel = {
        let label = ShadowLabel()
        return label
    }()
    
    private let alcholicLabel: ShadowLabel = {
        let label = ShadowLabel()
        return label
    }()
    
    
    // MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //MARK: - Configure cell values
    func configureCell(with drink: Drink) {
        self.headerTitle.text = drink.strDrink
        self.headerSubtitle.text = drink.strCategory
        self.glassLabel.text = drink.strGlass
        self.alcholicLabel.text = drink.strAlcoholic
        self.drinkImage.sd_setImage(with: URL(string: drink.strDrinkThumb), placeholderImage: UIImage(named: "default_image"))
    }
    
    //MARK: - UI
    /// create UI and setup constraints
    func setupView() {
        self.backgroundColor = .clear
        let containerView = UIView()
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 5
        containerView.backgroundColor = .clear
        
        self.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        containerView.addSubview(self.drinkImage)
        self.drinkImage.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        let verticalStackView = UIStackView()
        containerView.addSubview(verticalStackView)
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
        
        verticalStackView.addArrangedSubview(self.headerTitle)
        self.headerTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        verticalStackView.addArrangedSubview(self.headerSubtitle)
        self.headerSubtitle.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        verticalStackView.addArrangedSubview(self.alcholicLabel)
        self.alcholicLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        verticalStackView.addArrangedSubview(self.glassLabel)
        self.glassLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
}
