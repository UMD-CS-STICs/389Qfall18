//
//  MainVC.swift
//  Protocol
//
//  Created by CMSC389Q on 9/28/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var counter: Int = 5;
    
    var darkBackgroundColor: UIColor = UIColor(red: 34/255, green: 35/255, blue: 38/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.layer.cornerRadius = signInButton.frame.height/10
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGray
        
        makeDarkMode()
    }
    
    
    func makeDarkMode() {
        welcomeLabel.textColor = UIColor.white
        signInLabel.textColor = UIColor.white
        emailField.textColor = UIColor.white
        passwordField.textColor = UIColor.white
        emailLabel.textColor = UIColor.white
        passwordLabel.textColor = UIColor.white
        self.view.backgroundColor = darkBackgroundColor
    }
    
    func makeLightMode() {
        welcomeLabel.textColor = UIColor.black
        signInLabel.textColor = UIColor.black
        emailField.textColor = UIColor.black
        passwordField.textColor = UIColor.black
        emailLabel.textColor = UIColor.black
        passwordLabel.textColor = UIColor.black
        self.view.backgroundColor = UIColor.white

    }
    
    @IBAction func didTapSignIn(_ sender: UIButton) {
        // Perform Segue Here
        self.performSegue(withIdentifier: "goToSettings", sender: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    

}

