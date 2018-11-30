//
//  QuizGameVC.swift
//  DoYouKnowMe
//
//  Created by Tamer Bader on 11/23/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class QuizGameVC: UIViewController {
    
    // NOTE: This is the Quiz game screen! It pulls from Firebase to get an array of questions.
    // Each question has a question text, and four answer texts.
    // The two parts that have not been implemented yet are 1. On the answer table view cells, the text is not set and 2. Tapping the 'continue' button does nothing!
    
    @IBOutlet weak var questionCardView: UIView!
    @IBOutlet weak var questionStatusLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionsTable: UITableView!
    @IBOutlet weak var continueButton: UIButton!
    
    var selectedCellIndexPath: IndexPath?
    var questions: [Question] = [] // TODO: Question is an empty class
    var answers: [String] = []
    var currQuestionNumber: Int = -1
    var isAnsweringProfileQuestions: Bool = true
    var friendUsername: String?
    var finalCorrectAmount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Generate Sample Questions
        generateTestQuestions()
        
        // Set The Delegates
        optionsTable.delegate = self
        optionsTable.dataSource = self
        
        // Setup UI look
        questionCardView.layer.cornerRadius = 10
        questionCardView.layer.borderWidth = 2
        questionCardView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func didTapContinue(_ sender: UIButton) {
        // TODO: upon tapping continue, we want to do three things.
        // 1. Move on to the next question, so this means incrementing our counter (currQuestionNumber) and looking at the correct Question in our Question array.
        // 2. Check to see if we have finished all of our questions. If we have, then call the finishQuiz() method.
        // 3. Add the selected answer to our answers array. Our answers array will look something like this: ["answer1", "answer3", "answer1",...] where answer1 is the first choice, answer3 is the third choice, etc. You can print from the calculateScore() function to see what a sample answers array looks like if you are still confused.
        
        print("selected cell: \(self.selectedCellIndexPath!.row)") // currently selected cell index, set as global in 'didSelectRowAt' method
    }
    
    func generateTestQuestions() {
        // NOTE: make sure to modify the getDefaultQuiz() function in FirebaseConnector.swift to get this function to work!
        FirebaseConnector().getDefaultQuiz { (questions) in
            self.questions = questions
        }
    }
    
    func finishQuiz() {
        if (isAnsweringProfileQuestions) {
            FirebaseConnector().updateUserAnswers(userID: User.getCurrentUsername()!, answers: answers)
            self.present(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainNav"), animated: true, completion: nil)
        } else {
            calculateScore { (score) in
                self.finalCorrectAmount = score
                self.performSegue(withIdentifier: "goToGameOver", sender: nil)
            }
        }
    }
    
    func calculateScore(completion: @escaping(Int) -> ()) {
        FirebaseConnector().getUserAnswers(userID: friendUsername!) { (friendAnswers) in
            var correctAnswers = 0
            for i in 0..<self.answers.count {
                if (self.answers[i] == friendAnswers[i]) {
                    correctAnswers += 1
                }
            }
            completion(correctAnswers)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC: GameOverVC = segue.destination as! GameOverVC
        destVC.amountOfQuestions = self.answers.count
        destVC.correctAnswerAmount = self.finalCorrectAmount
        destVC.friendUsername = friendUsername!
    }
}

extension QuizGameVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GameOptionCell = tableView.dequeueReusableCell(withIdentifier: "optionCell") as! GameOptionCell
        // Updating View Of Options
        cell.optionView.layer.cornerRadius = cell.optionView.frame.height/2
        cell.optionView.layer.borderWidth = 2
        cell.optionView.layer.borderColor = UIColor.lightDYKMGray.cgColor
        cell.optionSelectedView.layer.cornerRadius
         = cell.optionSelectedView.frame.height/2
        cell.optionSelectedView.layer.borderWidth = 1
        cell.optionSelectedView.layer.borderColor = UIColor.lightDYKMGray.cgColor
        cell.optionSelectedView.backgroundColor = UIColor.white
        
        // TODO: Set the optionCell's text based on your questions array!
        
        cell.optionLabel.textColor = UIColor.darkDYKMGray
        cell.optionLabel.font = UIFont(name: "AvenirNext-Medium", size: 22)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return optionsTable.frame.height/4.2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (self.selectedCellIndexPath != nil) {
            let prevCell: GameOptionCell = optionsTable.cellForRow(at: selectedCellIndexPath!) as! GameOptionCell
            prevCell.optionLabel.textColor = UIColor.darkDYKMGray
            prevCell.optionLabel.font = UIFont(name: "AvenirNext-Medium", size: 22)
            prevCell.optionSelectedView.backgroundColor = UIColor.white
            prevCell.optionView.layer.borderColor = UIColor.lightDYKMGray.cgColor
        }
        self.selectedCellIndexPath  = indexPath
        let selectedCell: GameOptionCell =  optionsTable.cellForRow(at: indexPath) as! GameOptionCell
        selectedCell.optionLabel.textColor = UIColor.lightDYKMBlue
        selectedCell.optionLabel.font = UIFont(name: "AvenirNext-Bold", size: 22)
        selectedCell.optionSelectedView.backgroundColor = UIColor.lightDYKMBlue
        selectedCell.optionView.layer.borderColor = UIColor.lightDYKMBlue.cgColor
    }
}
