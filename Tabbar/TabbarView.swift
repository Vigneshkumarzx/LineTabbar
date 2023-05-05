//
//  TabbarView.swift
//  Tabbar
//
//  Created by vignesh kumar c on 05/05/23.
//

import UIKit

class TabbarView: UITabBar {
    private var shapeLayer: CAShapeLayer?
    var centerWidth: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        centerWidth = self.bounds.width / 2
        
        self.unselectedItemTintColor = .black
        self.tintColor = .white
        self.addShape()
    }
    
    func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = getPath()
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.fillColor = UIColor.systemCyan.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOpacity = 0.2
        
        if let oldShape = self.shapeLayer {
            self.layer.replaceSublayer(oldShape, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    func getPath() -> CGPath {
        let height: CGFloat = 47
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: centerWidth - height * 2, y: 0))
        
        path.addCurve(to: CGPoint(x: centerWidth, y: height),
                      controlPoint1: CGPoint(x: centerWidth - 30, y: 0),
                      controlPoint2: CGPoint(x: centerWidth - 35, y: height))
        
        path.addCurve(to: CGPoint(x: centerWidth + height * 2, y: 0),
                      controlPoint1: CGPoint(x: centerWidth + 35, y: height),
                      controlPoint2: CGPoint(x: centerWidth + 30, y: 0))
        
        path.addLine(to: CGPoint(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0 , y: 0))
        path.close()
        return path.cgPath
    }
    
    func updateCurveTappedItem() {
        guard let selectedTabView = self.selectedItem?.value(forKey: "view") as? UIView else { return }
        self.centerWidth = selectedTabView.frame.origin.x + (selectedTabView.frame.width / 2)
        addShape()
    }
}
