//
//  TabBarViewController.swift
//  Shop Coins
//
//  Created by Nick Logos on 12.10.23.
//

import UIKit
import SnapKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        let homeVC = HomeViewController()
        let favVC = FavoriteViewController()
        let bagVC = BagViewController()
        let profileVC = ProfileViewController()
        
        homeVC.title = "Главная"
        favVC.title = "Избранное"
        bagVC.title = "Корзина"
        profileVC.title = "Профиль"
        
        
        self.setViewControllers([homeVC, favVC, bagVC, profileVC], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["dollarsign.circle", "star.circle", "cart.circle", "person.circle"]
        
        for i in 0...3 {
            items[i].image = UIImage(systemName: images[i])
        }
        self.tabBar.tintColor = .black
    }
}
