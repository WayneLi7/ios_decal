//
//  HangmanViewController.swift
//  Hangman
//
//  Created by weili on 2/13/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    @IBOutlet weak var incorrectGuesses: UILabel!
    
    @IBOutlet weak var guessInput: UITextField!
    
    @IBOutlet weak var guessString: UILabel!
    
    var currentGame : HangmanGame?
    var stringToGuess : String?
    var charsLeftToGuess : [Bool]?
    var numWrongs : Int?
    var hangmanImgs : [UIImage] = [#imageLiteral(resourceName: "hangman1"), #imageLiteral(resourceName: "hangman2"), #imageLiteral(resourceName: "hangman3"), #imageLiteral(resourceName: "hangman4"), #imageLiteral(resourceName: "hangman5"), #imageLiteral(resourceName: "hangman6"), #imageLiteral(resourceName: "hangman7")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessInput.delegate = self
        guessInput.text = ""
        currentGame = HangmanGame()
        stringToGuess = currentGame!.stringToGuess
        guessString.text = ""
        incorrectGuesses.text = "Incorrect Guesses: "
        hangmanImg.image = #imageLiteral(resourceName: "hangman1")
        charsLeftToGuess = [Bool](repeating: false, count: stringToGuess!.count)
        wordToDisplay()
        numWrongs = 0
        for i in 0...stringToGuess!.count-1 {
            let index = stringToGuess!.index(stringToGuess!.startIndex, offsetBy: i)
            if stringToGuess![index] == " " {
                charsLeftToGuess![i] = true
            }
        }
        print(stringToGuess!)
        print(stringToGuess!.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func gameStartOver(_ sender: Any) {
        viewDidLoad()
    }
    
    @IBAction func guessMade(_ sender: UIButton) {
        let tempString = guessInput.text!.uppercased()
        if stringToGuess!.contains(tempString) {
            for i in 0...stringToGuess!.count-1 {
                let index = stringToGuess!.index(stringToGuess!.startIndex, offsetBy: i)
                if stringToGuess![index] == tempString[tempString.startIndex] {
                    charsLeftToGuess![i] = true
                }
            }
            wordToDisplay()
            if !charsLeftToGuess!.contains(false) {
                raiseWinAlert()
            }
            guessInput.text! = ""
        } else {
            if numWrongs! < 6 {
                numWrongs! += 1
                incorrectGuesses.text = incorrectGuesses.text! + " " + tempString
                hangmanImg.image = hangmanImgs[numWrongs!]
            } else {
                raiseLoseAlert()
            }
            
        }
    }
    
    func raiseWinAlert(){
        let alertController = UIAlertController(title: "Congrats!", message: "You've won the game!!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "New Game", style: .default) { (action:UIAlertAction) in
            self.viewDidLoad()
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func raiseLoseAlert(){
        let alertController = UIAlertController(title: "Sorry...", message: "You suck at it...", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "New Game", style: .default) { (action:UIAlertAction) in
            self.viewDidLoad()
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func wordToDisplay(){
        guessString.text = ""
        for i in 0...charsLeftToGuess!.count-1 {
            let c = charsLeftToGuess![i]
            if !c {
                guessString.text = guessString.text! + " " + "_"
            } else {
                let index = stringToGuess!.index(stringToGuess!.startIndex, offsetBy: i)
                guessString.text = guessString.text! + " " + [stringToGuess![index]]
            }
        }
    }
    
    @IBOutlet weak var hangmanImg: UIImageView!
}

extension HangmanViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == guessInput {
            return textField.text!.count < 1 || string == ""
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return false
    }

}

