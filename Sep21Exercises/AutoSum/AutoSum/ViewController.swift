//
//  ViewController.swift
//  AutoSum
//
//  Created by Travis Ho on 9/21/18.
//  Copyright © 2018 Travis Ho. All rights reserved.
//

import UIKit

// extend UITextFieldDelegate
class ViewController: UIViewController, UITextFieldDelegate {
    
    //Drag outlets for text field, and both display labels here
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.becomeFirstResponder()
        // set UITextFieldDelegate
        // add selector target for textFieldDidChange
    }
    
    /*
    @objc func textFieldDidChange(textField: UITextField){
        // update labels
    }
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}

