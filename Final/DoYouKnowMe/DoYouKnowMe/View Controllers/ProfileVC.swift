//
//  MainProfileVC.swift
//  DoYouKnowMe
//
//  Created by Tamer Bader on 11/23/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    // NOTE: This view displays your QR code and your username.
    // TODO: Just implement the UI in storyboard. We've included the code for setting the
    // IDLabel to your username, and generating the QR code from your username, in the comments below.
    // Make sure to re-connect the IBOutlets below to your views in storyboard.

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
