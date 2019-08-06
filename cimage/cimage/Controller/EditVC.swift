//
//  EditVC.swift
//  cimage
//
//  Created by imac on 8/6/19.
//  Copyright © 2019 JeguLabs. All rights reserved.
//

import UIKit

class EditVC: UIViewController, UIDropInteractionDelegate {
    
    // MARK: - Properties
    
    var cropImage: UIImage?
    
    lazy var editView: UIView = {
        let editView = UIView()
        editView.backgroundColor = .black
        if #available(iOS 11.0, *) {
            editView.addInteraction(UIDropInteraction(delegate: self))
        } else {
            print("Feelsbad")
        }
        
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
        imageToDrag.anchor(top: editView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 64, height: 64)
        imageToDrag.centerX(inView: view)
        
    }

}
