//
//  DrinksDetailViewModel.swift
//  drinks
//
//  Created by Benjamin on 25/06/2021.
//

import Foundation
import AVKit

class DrinksDetailViewModel: NSObject {
    private(set) var drink: Drink? {
        didSet {
            self.bindDrinkDetailViewModelToController()
        }
    }
    
    var bindDrinkDetailViewModelToController : (() -> ()) = {}
    
    func playVideo() -> AVPlayerViewController? {
        if let videoUrl = self.drink?.strVideo {
            let player = AVPlayer(url: URL(string: videoUrl)!)
            let avPlayerVC = AVPlayerViewController()
            
            avPlayerVC.player = player
            
            return avPlayerVC
        }

        return nil
    }
}
