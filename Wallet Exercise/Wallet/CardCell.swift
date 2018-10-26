//
//  CardCell.swift
//  Wallet
//
//  Created by Tamer Bader on 10/26/18.
//  Copyright © 2018 TamerBader. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var cardNumber: UILabel!
    
    @IBOutlet weak var cardInsideView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
