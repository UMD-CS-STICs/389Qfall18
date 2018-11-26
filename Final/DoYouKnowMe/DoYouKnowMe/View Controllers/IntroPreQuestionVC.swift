//
//  IntroPreQuestionVC.swift
//  DoYouKnowMe
//
//  Created by Tamer Bader on 11/23/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class IntroPreQuestionVC: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startButtonSuperView: UIView!
    
    var quizMode: QuizMode = .PROFILE
    var friendUsername: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButtonSuperView.layer.cornerRadius = 5
        
        switch quizMode {
        case .FRIEND:
            welcomeLabel.text = "Meet \(friendUsername!.capitalized) 🙌"
        case .PROFILE:
            // Retrieve Users Current Username
            let username: String = User.getCurrentUsername()!
            welcomeLabel.text = "Hi 👋 \(username.capitalized)"
        }
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func didTapStart(_ sender: UIButton) {
        self.performSegue(withIdentifier: "startProfileQuiz", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC: QuizGameVC = segue.destination as! QuizGameVC
        switch quizMode {
        case .FRIEND:
            destVC.isAnsweringProfileQuestions = false
            destVC.friendUsername = self.friendUsername
        case .PROFILE:
            destVC.isAnsweringProfileQuestions = true
        }
    }
}

enum QuizMode {
    case PROFILE
    case FRIEND
}
