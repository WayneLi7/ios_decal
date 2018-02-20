//
//  HangmanGame.swift
//  Hangman
//
//  Created by weili on 2/13/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import Foundation

class HangmanGame {
    
    public var stringToGuess : String
    private var currentGuess : Character?
    
    init() {
        let phrase = HangmanPhrases()
        self.stringToGuess = phrase.getRandomPhrase()
    }

}
