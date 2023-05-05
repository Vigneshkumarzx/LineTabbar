//
//  ViewController.swift
//  Tabbar
//
//  Created by vignesh kumar c on 05/05/23.
//

import UIKit

class CustomTabbarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Item tapped")
        if let tabbar = tabBar as? TabbarView {
            tabbar.updateCurveTappedItem()
        }
           
    }

}

