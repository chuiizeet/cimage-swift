//
//  MagnifyVC.swift
//  cimage
//
//  Created by imac on 8/2/19.
//  Copyright © 2019 JeguLabs. All rights reserved.
//

import UIKit

class MagnifyVC: UIView {
    
    // MARK: - Properties
    
    var viewToMagnify: UIView!
    
    var touchPoint: CGPoint!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    // MARK: - Helper Functions
    
    func commonInit() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 50
        self.layer.masksToBounds = true
    }
    
    func setTouchPoint(pt: CGPoint) {
        touchPoint = pt
        self.center = CGPoint(x: pt.x, y: pt.y - 100)
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 1 * (self.frame.size.width * 0.5), y: 1 * (self.frame.size.height) * 0.5)
        context?.scaleBy(x: 1.5, y: 1.5) // Scale
        context?.translateBy(x: -1 * (touchPoint.x), y: -1 * (touchPoint.y))
        self.viewToMagnify.layer.render(in: context!)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
