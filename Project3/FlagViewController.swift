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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(shareTapped))
    }
    
    private func loadImage() {
        if let imageToLoad = flagImagePath {
            flagImageView.image = UIImage(named: imageToLoad)
            flagImageView.layer.borderWidth = 1
            flagImageView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    @objc
    private func shareTapped() {
        guard let flagImage = flagImageView.image?.jpegData(compressionQuality: 0.8),
        var flagName = flagImagePath else {
            print("No image found")
            return
        }

        let firstDot = flagName.firstIndex(of: ".") ?? flagName.endIndex
        flagName = String(flagName[..<firstDot])
        
        let vc = UIActivityViewController(activityItems: [flagImage, flagName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
