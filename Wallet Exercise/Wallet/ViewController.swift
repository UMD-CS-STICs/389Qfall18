//
//  ViewController.swift
//  Wallet
//
//  Created by Tamer Bader on 10/26/18.
//  Copyright © 2018 TamerBader. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cards: [Card] = []

    @IBOutlet weak var addCardView: UIView!
    @IBOutlet weak var cardNumberField: UITextField!
    @IBOutlet weak var cardExpirationField: UITextField!
    @IBOutlet weak var cardTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let card1 = Card(withCardNumber: 4344456783566457, withExpiration: "09/20")
        cards.append(card1)
        let card2 = Card(withCardNumber: 3756654598752345, withExpiration: "10/20")
        cards.append(card2)
        
        cardTable.delegate = self
        cardTable.dataSource = self
        
        cardNumberField.delegate = self
        cardExpirationField.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CardCell = tableView.dequeueReusableCell(withIdentifier: "cardcell", for: indexPath) as! CardCell
        cell.cardNumber.text = "\(stringifyCardNumber(cardNum: cards[indexPath.row].number))"
        cell.cardInsideView.layer.borderWidth = 1
        cell.cardInsideView.layer.borderColor = UIColor.lightGray.cgColor
        cell.cardInsideView.layer.cornerRadius = 5
        
        return cell
    }
    @IBAction func didTapAddBarButton(_ sender: UIBarButtonItem) {
        // TODO: Handle Add From Bar Button
    }
    
    @IBAction func didTapAddToWallet(_ sender: UIButton) {
        // TODO: Handle Add Card To Wallets
        
        guard let cardText: String = cardNumberField.text else {
            return
        }
        
        guard let cardNumb: Int = Int(cardText) else {
            return
        }
        
        guard let cardExp: String = cardExpirationField.text else {
            return
        }
        
        let newCard: Card = Card(withCardNumber: cardNumb, withExpiration: cardExp)
        cards.append(newCard)
        
        
        // Clear the textfields
        cardExpirationField.text = ""
        cardNumberField.text = ""
        
        
        self.cardTable.reloadData()
    }
    
    func stringifyCardNumber(cardNum: Int) -> String {
        let cardString: String = "\(cardNum)"
        var currCharCount = 1;
        var cardNewString: String = ""
        for letter in cardString.characters {
            if (currCharCount % 5 == 0 && currCharCount != cardString.characters.count) {
                cardNewString += "-\(letter)"
                currCharCount += 1
            } else {
                cardNewString.append(letter)
            }
            
            currCharCount += 1
            
        }
        
        return cardNewString
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // TODO: Handle TextView Being Active
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // TODO: Handle TextField Being Hidden
        return true
    }
}

