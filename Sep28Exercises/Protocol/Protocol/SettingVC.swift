//
//  SettingVC.swift
//  Protocol
//
//  Created by CMSC389Q on 9/28/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var darkModeBtn: UIButton!
    @IBOutlet weak var lightModeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGray

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func didTapDark(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapLight(_ sender: UIButton) {
        
    }
    
    
    

}
