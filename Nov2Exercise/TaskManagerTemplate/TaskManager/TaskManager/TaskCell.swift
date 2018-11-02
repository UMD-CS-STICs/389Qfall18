//
//  TaskCell.swift
//  TaskManager
//
//  Created by CMSC389Q on 10/1/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    @IBOutlet weak var categoryMarker: UIView!
    
    @IBOutlet weak var taskTitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
