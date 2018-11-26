//
//  GameOverVC.swift
//  DoYouKnowMe
//
//  Created by Tamer Bader on 11/25/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class GameOverVC: UIViewController {
    var correctAnswerAmount: Int!
    var amountOfQuestions: Int!
    var friendUsername: String!
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let percentageCorrect: Double = calculatePercentage()
        
        if (percentageCorrect == 1.0) {
            self.headlineLabel.text = "WOW 😲"
            self.secondaryLabel.text = "You scored \(correctAnswerAmount!)/\(amountOfQuestions!). You really do know \(friendUsername!) 🙌"
        } else if (percentageCorrect < 1.0 && percentageCorrect >= 0.7) {
            self.headlineLabel.text = "Good Job 👍"
            self.secondaryLabel.text = "You scored \(correctAnswerAmount!)/\(amountOfQuestions!). So close!"
        } else if (percentageCorrect < 0.7 && percentageCorrect >= 0.4) {
            self.headlineLabel.text = "Hmmm 🤔"
            self.secondaryLabel.text = "You scored \(correctAnswerAmount!)/\(amountOfQuestions!). Not sure if you truly know \(friendUsername!) or not. 🙃"
        } else if (percentageCorrect < 0.4) {
            self.headlineLabel.text = "Ok... 😞"
            self.secondaryLabel.text = "You scored \(correctAnswerAmount!)/\(amountOfQuestions!). You suck at this game 👎"
        }
    }
    
    func calculatePercentage() -> Double {
        let correctAmount: Double = Double(correctAnswerAmount)
        let totalQuestions: Double = Double(amountOfQuestions)
        
        return correctAmount/totalQuestions
    }
    
    @IBAction func didTapDone(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
