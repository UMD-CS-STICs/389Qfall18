//
//  Tweet.swift
//  Twitter
//
//  Created by Tamer Bader on 10/9/18.
//  Copyright © 2018 TamerBader. All rights reserved.
//

import Foundation
import UIKit

class Tweet {
    var profileImage: UIImage
    var username: String
    var tweet: String
    init(profileImage: UIImage, username: String, tweet: String) {
        self.profileImage = profileImage
        self.username = username
        self.tweet = tweet
    }
    
    
}
