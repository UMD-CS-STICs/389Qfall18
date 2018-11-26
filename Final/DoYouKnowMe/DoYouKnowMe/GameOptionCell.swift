//
//  GameOptionCell.swift
//  DoYouKnowMe
//
//  Created by Tamer Bader on 11/23/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class GameOptionCell: UITableViewCell {

    @IBOutlet weak var optionView: UIView!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var optionSelectedView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
