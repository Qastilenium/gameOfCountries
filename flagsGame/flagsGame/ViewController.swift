//
//  ViewController.swift
//  flagsGame
//
//  Created by Ilryc Marokonen on 20.02.2024.
//

import UIKit

class ViewController: UIViewController {

    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        setupButtons()
        gameLogic()
    }
    

    
    // MARK: - Button
    @IBOutlet weak var buttonTop: UIButton!
    @IBOutlet weak var buttonMid: UIButton!
    @IBOutlet weak var buttonBot: UIButton!
    
    func setupButtons() {
        let bronze = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor

        buttonTop.layer.borderWidth = 1
        buttonTop.layer.borderColor = bronze
        
        buttonMid.layer.borderWidth = 1
        buttonMid.layer.borderColor = bronze
        
        buttonBot.layer.borderWidth = 1
        buttonBot.layer.borderColor = bronze
    }
    
    func gameLogic(action: UIAlertAction! = nil) {
        countries.shuffle()
        buttonTop.setImage(UIImage(named: countries[0]), for: .normal)
        buttonMid.setImage(UIImage(named: countries[1]), for: .normal)
        buttonBot.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score) now.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: gameLogic))
        present(ac, animated: true)
    }
}

