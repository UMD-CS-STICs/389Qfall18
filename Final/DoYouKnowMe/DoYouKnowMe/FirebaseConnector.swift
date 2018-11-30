//
//  FirebaseConnector.swift
//  DoYouKnowMe
//
//  Created by Travis Ho on 11/24/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import Foundation
import FirebaseDatabase
import SwiftyJSON

class FirebaseConnector {
    
    private let db = Database.database()
    
    func getDefaultQuiz(completion: @escaping(Array<Question>) -> ()) {
        db.reference(withPath: "default-quiz").observe(.value) { (snap) in
            guard let results = snap.value else {
                completion([])
                return
            }
            let json = JSON(results)
            var questions: Array<Question> = []
            if let arr = json.array {
                arr.forEach({ (jsonObj) in
                    print("question: \(jsonObj["question"].stringValue), answer1: \(jsonObj["answer1"].stringValue), answer2: \(jsonObj["answer2"].stringValue), answer3: \(jsonObj["answer3"].stringValue), answer4: \(jsonObj["answer4"].stringValue)")
                    // TODO: input correct values into Question's constructor. The jsonObj is the resulting object from the query to the database.
                    let question = Question()
                    questions.append(question)
                })
            }
            completion(questions)
        }
    }
    
    func getUserAnswers(userID: String, completion: @escaping(Array<String>) -> ()) {
        db.reference(withPath: "users").child(userID).child("default-quiz-answers").observe(.value) { (snap) in
            guard let results = snap.value as? NSArray else {
                completion([])
                return
            }
            let objCArray = NSMutableArray(array: results)
            if let swiftArray = objCArray as NSArray as? [String] {
                completion(swiftArray)
            }
        }
    }
    
    func getUserScore(userID: String, completion: @escaping(String) -> ()) {
        db.reference(withPath: "users").child(userID).child("quiz-log").observe(.value) { (snap) in
            if (snap.value is NSNull) {
                completion(String(format: "%.2f", 0))
                return
            }
            let json = JSON(snap.value!)
            var sum: Double = 0.0
            for (_, jsonObj) in json {
                sum += Double(jsonObj.string!)!                
            }
            completion(String(format: "%.2f", sum / Double(json.count)))
        }
    }
    
    func updateUserAnswers(userID: String, answers: Array<String>) {
        db.reference(withPath: "users").child(userID).updateChildValues(["default-quiz-answers" : answers])
    }
    
    func containsUser(userID: String, completion: @escaping(Bool) -> ()) {
        db.reference(withPath: "users").child(userID).observe(.value) { (snap) in
            completion(!(snap.value is NSNull))
        }
    }
}
