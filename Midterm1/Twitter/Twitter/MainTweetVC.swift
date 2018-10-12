//
//  MainTweetVC.swift
//  Twitter
//
//  Created by Tamer Bader on 10/9/18.
//  Copyright © 2018 TamerBader. All rights reserved.
//

import UIKit

class MainTweetVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // Array Of Tweets
    var tweets: [Tweet] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        buildTweets()
        
        // TODO: Set TableView Delegate and DataSource

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapAdd(_ sender: UIBarButtonItem) {
        // TODO: Perform segue to go to NewTweetVC
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Return number of tweets
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Return a new Tweet Cell With Properties and Fields Set
        
    }
    
    
    // Build a set of tweets to display
    func buildTweets() {
        let tweetOne: Tweet = Tweet(profileImage: UIImage(named: "bezos")!, username: "Jeff Bezos", tweet: "I'm so bored. Anyone know a business I can add to Amazon in order to put everyone out of business? #EveryoneBuysFromAmazon")
        let tweetTwo: Tweet = Tweet(profileImage: UIImage(named: "obama")!, username: "Obama", tweet: "Lmao Anyone miss me yet?")
        let tweetThree: Tweet = Tweet(profileImage: UIImage(named: "mark")!, username: "The Zucc", tweet: "I heard the funniest thing yesterday. My cybersecuirty advisor said we need to add 256-bit encyrption to facebook. LOL. That ain't it chief.")
        let tweetFour: Tweet = Tweet(profileImage: UIImage(named: "trump")!, username: "Donald Trump", tweet: "How big should we build that wall?")
        let tweetFive: Tweet = Tweet(profileImage: UIImage(named: "hillary")!, username: "Hillary Clinton", tweet: "Anyone see Bill anywhere? I've been trying to find him on the internet but im lost")
        let tweetSix: Tweet = Tweet(profileImage: UIImage(named: "loh")!, username: "Wallace Loh", tweet: "Ugh. I have so many testudo pins but don't know what to do with them. Slide in the DM's if you want one.")
        
        tweets.append(tweetOne)
        tweets.append(tweetTwo)
        tweets.append(tweetThree)
        tweets.append(tweetFour)
        tweets.append(tweetFive)
        tweets.append(tweetSix)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToMakeTweet") {
            let destVC: NewTweetVC = segue.destination as! NewTweetVC
            
            // TODO: Set Delegate For NewTweetVC
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Reload Data of  The Tweets Table View. Ex. self.tweetsTableView.reloadData()
    }
    
    
}

/*
 TODO: Add A Protocol and Delegate to Manage Adding Tweets
 */

