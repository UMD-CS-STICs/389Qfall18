//
//  AddUserVC.swift
//  DoYouKnowMe
//
//  Created by Tamer Bader on 11/25/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class AddUserVC: UIViewController {

    @IBOutlet weak var userIDField: UITextField!
    @IBOutlet weak var scanButton: UIButton!
    
    var friendUsername: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the TextField
        // TODO: Textfield delegate
        userIDField.attributedPlaceholder = NSAttributedString(string:"Enter Users Directory ID", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        // Show the keyboard
        userIDField.becomeFirstResponder()
    }
    
    @IBAction func didTapScan(_ sender: UIButton) {
        // TODO: open Barcode Scanner VC. Make sure to install the Cocoapod. Documentation: https://github.com/hyperoslo/BarcodeScanner
    }
    
    @IBAction func didTapBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func alertWithTitle(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func startQuiz(username: String) {
        FirebaseConnector().containsUser(userID: username) { (containsUser) in
            if (!containsUser) {
                self.alertWithTitle(title: "User does not exist")
            } else if (username == User.getCurrentUsername()!) {
                self.alertWithTitle(title: "You can't test yourself!")
            } else {
                self.friendUsername = username
                self.performSegue(withIdentifier: "goToMatchScreen", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC: IntroPreQuestionVC = segue.destination as! IntroPreQuestionVC
        destVC.friendUsername = friendUsername!
        destVC.quizMode = .FRIEND
    }
}

// TODO: TextFieldDelegate shouldReturn function, passes correct variable to startQuiz. IntroUsernameVC may inspire you.

//Barcode scanner delegate code:
//extension AddUserVC: BarcodeScannerCodeDelegate, BarcodeScannerDismissalDelegate {
//    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
//        startQuiz(username: code)
//        controller.dismiss(animated: true, completion: nil)
//    }
//
//    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
//        controller.dismiss(animated: true, completion: nil)
//    }
//}
