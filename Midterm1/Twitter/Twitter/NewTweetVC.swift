//
//  NewTweetVC.swift
//  Twitter
//
//  Created by Tamer Bader on 10/9/18.
//  Copyright © 2018 TamerBader. All rights reserved.
//

import UIKit

class NewTweetVC: UIViewController {
    @IBOutlet weak var cancelButton: NSLayoutConstraint!
    @IBOutlet weak var tweetButton: UIButton!
    @IBOutlet weak var tweetField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetField.becomeFirstResponder()
        tweetButton.layer.cornerRadius = tweetButton.frame.height/3
        
    }
    
    @IBAction func didTapTweet(_ sender: UIButton) {
        guard let tweetMessage: String = tweetField.text else {
            return
        }
        
        let newTweet: Tweet = Tweet(profileImage: User.profileImage, username: User.username, tweet: tweetMessage)
        
        // TODO: Call Delegate to Add New Tweet
        
        // Dismiss The ViewController
        tweetField.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapCancel(_ sender: UIButton) {
        tweetField.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
    
}
