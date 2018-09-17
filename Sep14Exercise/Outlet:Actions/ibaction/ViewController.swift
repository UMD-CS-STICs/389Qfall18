//
//  ViewController.swift
//  ibaction
//
//  Created by CMSC389Q on 9/14/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlet to the Dark Gray View
    @IBOutlet weak var centerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setting the background color of the dark gray view to red
        centerView.backgroundColor = UIColor.red
        
        // Grabbing the Square Views Width
        print("The width is \(centerView.frame.width))")
        
        // Setting a border
        centerView.layer.borderWidth = 10
        centerView.layer.borderColor = UIColor.blue.cgColor
        
        // Setting a corner radius
        centerView.layer.cornerRadius = centerView.frame.height/2
        
    }
    @IBAction func didTapClickMe(_ sender: UIButton) {
        // When User Taps Click Me Button, Change Background Color to Green
        centerView.backgroundColor = UIColor.green
        print("User Tapped Click Me")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

