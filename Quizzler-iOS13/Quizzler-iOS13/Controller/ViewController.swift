//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionView: UILabel!
   
    @IBOutlet weak var option1Button: UIButton!
    
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
   
    @IBOutlet weak var scoreView: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer){
            sender.backgroundColor = UIColor.green
            
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateView), userInfo: nil, repeats: false)
    }
    @objc func updateView(){
        progressBar.progress = quizBrain.getProgressBar()
        questionView.text = quizBrain.getQuestionText()
        scoreView.text = "Score: \(quizBrain.getScore())"
        let answerChoices = quizBrain.getVariants()
        
        option1Button.setTitle(answerChoices[0], for: .normal)
        
        option2Button.setTitle(answerChoices[1], for: .normal)
        
        option3Button.setTitle(answerChoices[2], for: .normal)
        
        option1Button.backgroundColor = UIColor.clear
        option2Button.backgroundColor = UIColor.clear
        option3Button.backgroundColor = UIColor.clear
    }
    
    
}

