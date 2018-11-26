//
//  User.swift
//  DoYouKnowMe
//
//  Created by Tamer Bader on 11/23/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import Foundation

class User {
    
    static func saveUsername(username: String) {
        // TODO: Save Username into UserDefaults
    }
    
    static func getCurrentUsername() -> String? {
        // TODO: Retreive Username from UserDefaults
        return ""
    }
    
    // For testing. Call it to get rid of current saved username
    static func resetUsername() {
        let defaults = UserDefaults.standard
        defaults.set(nil, forKey: "whatever key you decided to use")
    }
}
