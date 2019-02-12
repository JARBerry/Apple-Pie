//
//  Game.swift
//  Apple Pie
//
//  Created by Ray and James Berry on 14/11/2018.
//  Copyright © 2018 JARBerry. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
  
    var guessedLetters: [Character]
    var score: Int
    
    // check if letter input matches letter in the word selected. update scores and update the word displayed.
    
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

