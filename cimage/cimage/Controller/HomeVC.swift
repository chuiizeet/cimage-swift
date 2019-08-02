//
//  HomeVC.swift
//  cimage
//
//  Created by imac on 8/2/19.
//  Copyright © 2019 JeguLabs. All rights reserved.
//

import UIKit
import ZImageCropper

class HomeVC: UIViewController {
    
    // MARK: - Properties
    
    private var magnifyView: MagnifyVC?
    
    let img = UIImage(named: "waifu")
    
    let debugLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "CropImage BezierPath algorithm"
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var imageView: ZImageCropperView = {
        
        let image = ZImageCropperView()
        image.isUserInteractionEnabled = true
        image.strokeColor = .red
        image.image = self.img
        image.contentMode = .scaleAspectFill
        
        return image
        
    }()
    
    let cropBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Crop Bezier", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 25
        
        btn.addTarget(self, action: #selector(handleCropBtnPressed), for: .touchUpInside)
        
        return btn
    }()
    
    let resetBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Reset Bezier", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.red.cgColor
        btn.layer.cornerRadius = 25
        
        btn.addTarget(self, action: #selector(handleResetBtnPressed), for: .touchUpInside)
        
        return btn
    }()
    
    let testView: UIView = {
        let testView = UIView()
        testView.backgroundColor = .red
        testView.isUserInteractionEnabled = true
        return testView
        
    }()
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.isUserInteractionEnabled = true

        setupViewComponents()
    }
    
    // MARK: - Helper functions
    
    func setupViewComponents() {
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        imageView.center(inView: view)
        
        view.addSubview(cropBtn)
        cropBtn.anchor(top: imageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 50)
        
        view.addSubview(debugLbl)
        debugLbl.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 75, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        debugLbl.centerX(inView: view)
        
        view.addSubview(resetBtn)
        resetBtn.anchor(top: cropBtn.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 12, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 50)
        
        view.addSubview(testView)
        testView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 25, paddingRight: 01, width: 0, height: 100)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: view)
        if magnifyView == nil {
            magnifyView = MagnifyVC.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            magnifyView?.viewToMagnify = view
            magnifyView?.setTouchPoint(pt: point!)
            self.view.addSubview(magnifyView!)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if magnifyView != nil {
            magnifyView?.removeFromSuperview()
            magnifyView = nil
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: view)
        magnifyView?.setTouchPoint(pt: point!)
        magnifyView?.setNeedsDisplay()
    }
    
    
    // MARK: - Handlers
    
    @objc func handleCropBtnPressed() {
        imageView.image = imageView.cropImage()
    }
    
    @objc func handleResetBtnPressed() {
        imageView.shapeLayer.removeFromSuperlayer()
        imageView.resetCrop()
    }


}

