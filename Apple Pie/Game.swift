//
//  Game.swift
//  Apple Pie
//
//  Created by Ray Berry on 14/11/2018.
//  Copyright © 2018 JARBerry. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
  
    var guessedLetters: [Character]
    var score: Int
    
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1

        } else {
            score += 1
        }
    }
    var formattedWord: String {
        var guessedWord = ""
    
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            
            } else {
                guessedWord += "_"
            }
        }

        return guessedWord
        
    }

}

