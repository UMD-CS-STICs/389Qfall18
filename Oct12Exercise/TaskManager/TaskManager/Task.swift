//
//  Task.swift
//  TaskManager
//
//  Created by CMSC389Q on 10/1/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import Foundation

class Task {
    var title: String
    var category: Category
    
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
