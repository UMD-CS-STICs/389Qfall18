//
//  Task.swift
//  TaskManager
//
//  Created by CMSC389Q on 10/1/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import Foundation

// make task encodable by making it an NSObject and NSCoding
class Task: NSObject, NSCoding {
    
    var title: String
    var category: Category
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(category.rawValue, forKey: "category")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "title") as? String ?? ""
        self.category = Category(rawValue: aDecoder.decodeObject(forKey: "category") as! String)!
    }
    

    
    init(withTitle title: String, withCategory category: Category) {
        self.title = title
        self.category = category
    }
    
}

enum Category: String{
    case MATH = "Math"
    case SCIENCE = "Science"
    case ENGLISH = "English"
}
