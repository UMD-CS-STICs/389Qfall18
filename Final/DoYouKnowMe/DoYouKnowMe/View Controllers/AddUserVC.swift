//
//  AddUserVC.swift
//  DoYouKnowMe
//
//  Created by Tamer Bader on 11/25/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class AddUserVC: UIViewController {
    
    // NOTE: This screen has a textfield for inputting a friend's username, and a button that opens the QR scanner on your camera.
    // Two parts have not been implemented on this screen. 1. Upon hitting enter in the userIDField it should call startQuiz(username) with the text input. 2. clicking the barcode scanner button does not open the barcode VC.

    @IBOutlet weak var userIDField: UITextField!
    @IBOutlet weak var scanButton: UIButton!
    
    var friendUsername: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: set the userIDField's delegate
        
        userIDField.attributedPlaceholder = NSAttributedString(string:"Enter Users Directory ID", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        // Show the keyboard
        userIDField.becomeFirstResponder()
    }
    
    @IBAction func didTapScan(_ sender: UIButton) {
        // TODO: Install the BarcodeScanner Cocoapod: https://github.com/hyperoslo/BarcodeScanner
        // Then, uncomment the code below and at the bottom of the file. This creates the Barcode VC, sets its delegate functions, and presents it.
//        let controller: BarcodeScannerViewController = BarcodeScannerViewController()
//        controller.codeDelegate = self
//        controller.dismissalDelegate = self
//        self.present(controller, animated: true, completion: nil)
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

// TODO: Implement the TextFieldDelegate's 'should return' function

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
