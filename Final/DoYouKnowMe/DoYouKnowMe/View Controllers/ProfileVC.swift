//
//  MainProfileVC.swift
//  DoYouKnowMe
//
//  Created by Tamer Bader on 11/23/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

//    @IBOutlet weak var barcodeImageView: UIImageView!
//    @IBOutlet weak var idLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        if let userIDText = User.getCurrentUsername() {
//            idLabel.text = "Username: \(userIDText)"
//            setQRImage(userID: userIDText)
//        } else {
//            idLabel.text = "An error has occured"
//        }
    }
    
    @IBAction func didTapMatch(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToAddUser", sender: nil)
    }
    
//    func setQRImage(userID: String) {
//        barcodeImageView.image = QRPRovider().generateQRCode(from: userID)
//    }
}
