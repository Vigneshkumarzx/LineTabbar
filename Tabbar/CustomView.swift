//
//  CustomView.swift
//  Tabbar
//
//  Created by vignesh kumar c on 05/05/23.
//

import Foundation
import UIKit

class AnimatedTabBarView: UIView {
    
    private var tab1Button: UIButton!
    private var tab2Button: UIButton!
    private var tab3Button: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Create the tab buttons
        tab1Button = createTabButton(iconName: "home", title: "Home")
        tab2Button = createTabButton(iconName: "search", title: "Search")
        tab3Button = createTabButton(iconName: "person", title: "Profile")
        
        // Add the tab buttons to the view
        addSubview(tab1Button)
        addSubview(tab2Button)
        addSubview(tab3Button)
        
        // Add constraints for the tab buttons
        // ...
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createTabButton(iconName: String, title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: iconName), for: .normal)
        button.setTitle(title, for: .normal)
        button.tintColor = UIColor.black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 45, left: -25, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    @objc private func tabButtonTapped(_ sender: UIButton) {
        // Handle tab button tap event
    }
}
