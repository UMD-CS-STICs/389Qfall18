//
//  Card.swift
//  Wallet
//
//  Created by Tamer Bader on 10/26/18.
//  Copyright © 2018 TamerBader. All rights reserved.
//

import Foundation

class Card {
    var number: Int
    var expiration: String
    
    
    init(withCardNumber cardNumber: Int, withExpiration expiration: String) {
        self.number = cardNumber
        self.expiration = expiration
    }
}
