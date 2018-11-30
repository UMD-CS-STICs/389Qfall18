//
//  IntroUsernameVC.swift
//  DoYouKnowMe
//
//  Created by Tamer Bader on 11/23/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class IntroUsernameVC: UIViewController {
    // NOTE: This is the login screen. After the user enters their username, we save it locally.
    // If the user has already logged in before, we skip to the profile page; otherwise, we
    // go to the quiz intro screen so the user can begin filling out their own survey.

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
            // TODO: IntroPreQuestionVC (the greetings page) has two modes.
            // 1. PROFILE for when you're taking your own quiz and 2. FRIEND
            // for when you're taking a friend's quiz.
            // set the public variable quizMode in IntroPreQuestionVC to be the correct quiz mode type.
        }
    }
}

extension IntroUsernameVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let usernameText = textField.text, usernameText != "" {
            
            // TODO: Implement the save function in User.
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
