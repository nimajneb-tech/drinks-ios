//
//  DrinksDetailViewController.swift
//  drinks
//
//  Created by Benjamin on 25/06/2021.
//

import Foundation
import UIKit
import SnapKit
import WebKit
import RxSwift

class DrinksDetailViewController: ParentViewController {
    
    //MARK: - Internal Variables
    private let disposeBag = DisposeBag()
    
    private let drinkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let drinkTitle: ShadowLabel = {
        let label = ShadowLabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private let scrollContentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let videoHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.alpha = 0.7
        label.text = "Video"
        
        return label
    }()
    
    private let videoView: WKWebView = {
        let webView = WKWebView()
        
        return webView
    }()
    
    private let favoritIcon: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private var viewModel: DrinksDetailViewModel?
    
    //MARK: - Initialize
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
        self.setupView()
        self.setupActions()
    }
    
    func bindToViewModel(with drink: Drink) {
        self.viewModel = DrinksDetailViewModel(drink: drink)
        self.drinkImage.sd_setImage(with: self.viewModel?.thumbUrl, placeholderImage: UIImage(named: "default_image"))
        self.drinkTitle.text = self.viewModel?.displayDrinkName
    }
    
    //MARK: - Setup Actions
    func setupActions() {
        DispatchQueue.main.async {
            if let request = self.viewModel?.loadVideo() {
                self.videoView.load(request)
            }
        }
    }
    
    //MARK: - Setup UI
    /// create UI and setup constraints
    func setupView() {
        self.view.addSubview(self.drinkImage)
        self.drinkImage.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(self.view.bounds.height / 3.5)
        }
        
        self.view.addSubview(self.drinkTitle)
        self.drinkTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.drinkImage.snp.bottom).inset(15)
        }
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(self.drinkImage.snp.bottom)
        }
        
        self.scrollView.addSubview(self.scrollContentView)
        self.scrollContentView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        let ingredientView = IngredientView(drink: self.viewModel?.drink)
        ingredientView.setContentHuggingPriority(.defaultLow, for: .vertical)
        self.scrollContentView.addSubview(ingredientView)
        ingredientView.snp.makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        let instructionsView = InstructionsView(drink: self.viewModel?.drink)
        self.scrollContentView.addSubview(instructionsView)
        instructionsView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(ingredientView.snp.bottom)
            make.bottom.equalToSuperview().inset(40)
        }
        
        if self.viewModel?.drink?.strVideo != nil {
            
            instructionsView.snp.remakeConstraints { (remake) in
                remake.leading.equalToSuperview()
                remake.trailing.equalToSuperview()
                remake.top.equalTo(ingredientView.snp.bottom)
            }

            self.scrollContentView.addSubview(self.videoHeader)
            self.videoHeader.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(10)
                make.top.equalTo(instructionsView.snp.bottom).offset(10)
            }
            
            self.scrollContentView.addSubview(self.videoView)
            self.videoView.snp.makeConstraints { (make) in
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.top.equalTo(self.videoHeader.snp.bottom).offset(10)
                make.height.equalTo(self.view.bounds.height / 2.5)
                make.bottom.equalToSuperview()
            }
        }
    }
}
