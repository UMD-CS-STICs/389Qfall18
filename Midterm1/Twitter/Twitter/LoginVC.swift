//
//  LoginVC.swift
//  Twitter
//
//  Created by Tamer Bader on 10/9/18.
//  Copyright © 2018 TamerBader. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        
        
        // TODO: Add Delegate of Username Field and Password Field To Self
        
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        
        // Perform Segue To Main Tweets Page
        self.performSegue(withIdentifier: "goToTweets", sender: nil)
    }
    
    // Set your Username and Password Field Delegate to Self In Order To Hide Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
