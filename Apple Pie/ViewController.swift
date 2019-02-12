//
//  ViewController.swift
//  Apple Pie
//
//  Created by Ray and James Berry on 14/11/2018.
//  Copyright © 2018 JARBerry. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    // Limited list of words to guess held in an array
    
    var listOfWords = ["dog", "cat", "monkey", "lion", "kangaroo", "leopard", "elephant", "giraffe", "rhino", "chimpanzee"]
    
    
    // 7 tries to get it right
    
    let incorrectMovesAllowed = 7
    
    // counter to number of wins
    
    var totalWins = 0 {
        didSet {
            
            newRound()
        }
    }
    
    // counter for number of loasses
    var totalLosses = 0 {
        didSet {
            print (oldWord)
            newRound()
        }
    }
    
   var oldWord = ""
    
  
    
    var currentGame: Game!
    
    var displayedScore = 0 {
        didSet {
            updateUI()
            
        }
    }
    
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newRound()
    }
    
    
    
    
    //New round - retrieve new word and reset incorrect moves
    
    func newRound() {
        
    
        if !listOfWords.isEmpty {
              
            
             
            let newWord = listOfWords.removeFirst()
    
            oldWord = newWord
            
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [], score: displayedScore)
            enableLetterButtons(true)
            updateUI()
        
        } else {
            enableLetterButtons(false)
            
        }
    }
    
    // enable buttons
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    // print wins, losses and scores and update tree image
    
    func updateUI() {
        var letters = [String]()
        
        
//        for letter in currentGame.formattedWord {
//            letters.append(String(letter))
//        }
        
        
        // used mapping instead of For Loop
        
        letters = currentGame.formattedWord.map {String($0)}
        

        
        let wordWithSpacing = letters.joined(separator: " ")
        
        

        if currentGame.incorrectMovesRemaining == 0 {
        
        correctWordLabel.text = oldWord
        } else {
        correctWordLabel.text = wordWithSpacing
        }
        
        // displays score and wins and losses
        
        scoreLabel.text = "Score: \(displayedScore), Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
      
       
    }
    
    // button tapped, pass through button pressed and update game state
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
        
    }
    
    // updated scores, wins and losses
    
    func updateGameState() {
        
     displayedScore = currentGame.score
    
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        
            
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
            
        } else {
            
            updateUI()
        }
        
        
        
    }
    
    
}

