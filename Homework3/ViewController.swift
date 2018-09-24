//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Tamer Bader on 9/21/18.
//  Copyright © 2018 Tamer Bader. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var buttonFifteen: UIButton!
    @IBOutlet weak var buttonTwenty: UIButton!
    @IBOutlet weak var buttonTwentyFive: UIButton!
    @IBOutlet weak var tipField: UITextField!
    @IBOutlet weak var totalField: UILabel!
    
    // Tip Amount Variable
    var tipAmount: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set The Delegate
        tipField.delegate = self
    }
    
    // Tip Button Actions
    @IBAction func didTap15(_ sender: UIButton) {
        // Update Tip Amount, Background Color, and Recalculate Total
        
    }
    
    @IBAction func didTap20(_ sender: UIButton) {
        // Update Tip Amount, Background Color, and Recalculate Total
        
    }
    @IBAction func didTap25(_ sender: UIButton) {
        // Update Tip Amount, Background Color, and Recalculate Total

    }
    
    // Do Not Touch. Delegate Method That Runs Everytime the Keyboard Return Button is hit
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // This Hides the keyboard
        textField.resignFirstResponder()
        
        // This will recalculate tip total and show it to the user
        calculateTotal()
        return true
        
    }
    
    // Method to Recalculate the tip amount and display it to the user
    func calculateTotal() {
        // Converts the textfields string to a double. Will return if it can't.
        guard var amount: Double = Double(tipField.text!) else {
            return
        }
        
        /* Take the amount that the user has entered and calculate the total after the tip has been factored in. Then update the total tip amount label*/

        
    }

    
    
}

