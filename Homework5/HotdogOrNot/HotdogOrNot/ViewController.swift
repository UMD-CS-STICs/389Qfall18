//
//  ViewController.swift
//  HotdogOrNot
//
//  Created by Travis Ho on 11/9/18.
//  Copyright © 2018 Travis Ho. All rights reserved.
//

import UIKit

protocol SetImageDelegate {
    func setImage(named: String)
}

class ViewController: UIViewController, SetImageDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textContainer: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "dog1")
    }
    
    func setImage(named name: String) {
        imageView.image = UIImage(named: name)
        
        /* convert to CIImage, and test with our ML model, to correctly set isHotDog */
        let isHotdog = true
        updateUI(isHotdog: isHotdog)
    }
    
    func updateUI(isHotdog: Bool) {
        if (isHotdog) {
            textLabel.text = "Yes a Hotdog"
            // #2ecc71
            textContainer.backgroundColor = UIColor(displayP3Red: 46.0/255, green: 204.0/255, blue: 113.0/255, alpha: 1)
        } else {
            textLabel.text = "Not a Hotdog"
            // #e74c3c
            textContainer.backgroundColor = UIColor(displayP3Red: 231.0/255, green: 76.0/255, blue: 60.0/255, alpha: 1)
        }
    }
    
    @IBAction func folderButtonTapped(_ sender: UIBarButtonItem) {
        let folderViewController = self.storyboard!.instantiateViewController(withIdentifier: "FolderViewController") as! FolderViewController
        folderViewController.setImageDelegate = self
        self.navigationController?.pushViewController(folderViewController, animated: true)
    }
}

