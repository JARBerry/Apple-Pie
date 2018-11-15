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
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    

    
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
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [], score: displayedScore)
            enableLetterButtons(true)
        updateUI()
        } else {
            enableLetterButtons(false)
            
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    // update total scores
    
    func updateUI() {
        var letters = [String]()
        
        
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        
        
        
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Score: \(displayedScore), Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
   sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
        
    }
    
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

