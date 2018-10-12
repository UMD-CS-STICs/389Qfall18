//
//  TableViewCell.swift
//  TableViewExample
//
//  Created by Travis Ho on 9/28/18.
//  Copyright © 2018 Travis Ho. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var checked: Bool = false

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkButton.layer.cornerRadius = checkButton.bounds.height / 2.0
        checkButton.layer.borderWidth = 0.5
        checkButton.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func tapCheckButton(_ sender: UIButton) {
        checked = !checked
        if (checked) {
            checkButton.backgroundColor = UIColor.blue
        } else {
            checkButton.backgroundColor = UIColor.white
        }
    }
    
}
