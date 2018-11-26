//
//  IntroUsernameVC.swift
//  DoYouKnowMe
//
//  Created by Tamer Bader on 11/23/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class IntroUsernameVC: UIViewController {

    @IBOutlet weak var userIDField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the textfield delegate
        userIDField.delegate = self
        
        userIDField.attributedPlaceholder = NSAttributedString(string:"Enter Your Directory ID", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

        // Make the keyboard pop up when first seen
        userIDField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToReadyScreen" {
            // TODO: Correctly set IntroPreQuestionVC quizMode variable
        }
    }
}

extension IntroUsernameVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let usernameText = textField.text, usernameText != "" {
            
            // TODO: Implement in User, saving username into UserDefaults
            User.saveUsername(username: usernameText)
            
            FirebaseConnector().containsUser(userID: usernameText, completion: { (containsUser) in
                let mainNav = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "mainNav") as? UINavigationController
                if containsUser {
                    self.present(mainNav!, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: "goToReadyScreen", sender: nil)
                }
            })
            
            return true
        } else {
            return false
        }
    }
}
