//
//  QuizGameVC.swift
//  DoYouKnowMe
//
//  Created by Tamer Bader on 11/23/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class QuizGameVC: UIViewController {
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
        // TODO: build answers array. Iterate through Questions array. Call finishQuiz() when the quiz is over.
        print("selected cell: \(self.selectedCellIndexPath!.row)") // currently selected cell index, set as global in 'didSelectRowAt' method
    }
    
    func generateTestQuestions() {
        // TODO: In FirebaseConnector's getDefaultQuiz() function, we create the Question array. Once you've created your Question.swift, make sure to modify this function.
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
        
        // TODO: optionCell Text
        
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
