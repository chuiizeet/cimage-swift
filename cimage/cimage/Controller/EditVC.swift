//
//  EditVC.swift
//  cimage
//
//  Created by imac on 8/6/19.
//  Copyright © 2019 JeguLabs. All rights reserved.
//

import UIKit

class EditVC: UIViewController {
    
    // MARK: - Properties
    
    var cropImage: UIImage?
    
    var panGesture  = UIPanGestureRecognizer()
    
    lazy var editView: UIView = {
        let editView = UIView()
        editView.backgroundColor = .black

        let cropView = UIImageView()
        cropView.clipsToBounds = true
        cropView.image = self.cropImage!
        
        editView.addSubview(cropView)
        cropView.center(inView: editView)
        
        return editView
    }()
    
    let imageToDrag: UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleToFill
        imgView.image = UIImage(named: "nice")
        return imgView
    }()
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewComponents()
    }
    
    // MARK: - Helper Functions
    
    func setupViewComponents() {
        
        view.backgroundColor = .white
        
        view.addSubview(editView)
        editView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: view.frame.height / 2)
        
        
        view.addSubview(imageToDrag)
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragImg))
        imageToDrag.isUserInteractionEnabled = true
        imageToDrag.addGestureRecognizer(panGesture)
        imageToDrag.anchor(top: editView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 64, height: 64)
        imageToDrag.centerX(inView: view)
        
    }
    
    func savePng() {
        
    }
    
    
    // MARK: - Selectors
    
    @objc func dragImg(_ sender:UIPanGestureRecognizer){
        let translation = sender.translation(in: self.editView)
        imageToDrag.center = CGPoint(x: imageToDrag.center.x + translation.x, y: imageToDrag.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.editView)
    }
    
    //Pinch Gesture for zoom in and zoom out
    @IBAction func scaleImg(_ sender: UIPinchGestureRecognizer) {
        imageToDrag.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    
    
    
    
}
