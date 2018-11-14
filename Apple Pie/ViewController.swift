//
//  ViewController.swift
//  Apple Pie
//
//  Created by Ray and James Berry on 14/11/2018.
//  Copyright © 2018 JARBerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["dog", "cat", "monkey", "lion", "kangaroo", "leopard", "elephant", "giraffe", "rhino", "chimpanzee"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    
    var totalLosses = 0
    
    var currentGame: Game!
    
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       newRound()
    }
    
    
   
    
    func newRound() {
        
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
        
    }
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
   sender.isEnabled = false
        
        
        
        
    
    }
    


}

