//
//  AnimatedController.swift
//  Tabbar
//
//  Created by vignesh kumar c on 05/05/23.
//

import Foundation
import UIKit

class AnimatedTabBarController: UITabBarController {

    private var animatedTabBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Remove the default tab bar
        self.tabBar.isHidden = true
        
        // Add the custom tab bar view
        animatedTabBarView = UIView()
        animatedTabBarView.backgroundColor = UIColor.white
        animatedTabBarView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(animatedTabBarView)
        
        NSLayoutConstraint.activate([
            animatedTabBarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            animatedTabBarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            animatedTabBarView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            animatedTabBarView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
