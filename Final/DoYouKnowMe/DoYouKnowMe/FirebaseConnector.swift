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
                    // The values on the JSON obj:
                    print("question: \(jsonObj["question"].stringValue), answer1: \(jsonObj["answer1"].stringValue), answer2: \(jsonObj["answer2"].stringValue), answer3: \(jsonObj["answer3"].stringValue), answer4: \(jsonObj["answer4"].stringValue)")
                    // TODO: input correct values into Question's constructor.
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
    
    func getQuizzesTaken(userID: String, completion: @escaping(Array<QuizEntry>) -> ()) {
        db.reference(withPath: "users").child(userID).child("quiz-taken-log").observe(.value) { (snap) in
            if (snap.value is NSNull) {
                completion([])
                return
            }
            var quizEntries: Array<QuizEntry> = []
            let json = JSON(snap.value!)
            for (key, jsonObj) in json {
                let quizEntry = QuizEntry.init(username: key, score: jsonObj.string!)
                quizEntries.append(quizEntry)
            }
            completion(quizEntries)
        }
    }
    
    func updateUserAnswers(userID: String, answers: Array<String>) {
        db.reference(withPath: "users").child(userID).updateChildValues(["default-quiz-answers" : answers])
    }
    
    func updateQuizLogs(userID: String, friendID: String, score: String) {
        db.reference(withPath: "users").child(userID).child("quiz-taken-log").updateChildValues([friendID : score])
        db.reference(withPath: "users").child(friendID).child("quiz-log").updateChildValues([userID : score])
    }
    
    func containsUser(userID: String, completion: @escaping(Bool) -> ()) {
        db.reference(withPath: "users").child(userID).observe(.value) { (snap) in
            completion(!(snap.value is NSNull))
        }
    }
}
