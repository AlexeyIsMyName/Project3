//
//  FlagViewController.swift
//  Project3
//
//  Created by ALEKSEY SUSLOV on 22.10.2022.
//

import UIKit

class FlagViewController: UIViewController {

    @IBOutlet var flagImageView: UIImageView!
    
    var flagImagePath: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
    }
    
    private func loadImage() {
        if let imageToLoad = flagImagePath {
            flagImageView.image = UIImage(named: imageToLoad)
            flagImageView.layer.borderWidth = 1
            flagImageView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}
