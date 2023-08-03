//
//  ViewController.swift
//  Quizzer
//
//  Created by Rustin Wilde on 21.05.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    
    @IBOutlet weak var questionLbl: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var scoreCounter: UILabel!
    
   var quizBrain = QuizBrain()
    
    
    var timer = Timer()
    var progressCalculation : Float = 0.0
    var remainingProgress : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        firstAnswer.layer.borderWidth = 3.0
        firstAnswer.layer.borderColor = CGColor(red: 108/255, green: 122/255, blue: 157/255, alpha: 1)
        firstAnswer.tintColor = UIColor(red: 217, green: 224, blue: 236, alpha: 1)
        firstAnswer.layer.cornerRadius = 20.0
        
        secondAnswer.layer.borderWidth = 3.0
        secondAnswer.layer.borderColor = CGColor(red: 108/255, green: 122/255, blue: 157/255, alpha: 1)
        secondAnswer.tintColor = UIColor(red: 217, green: 224, blue: 236, alpha: 1)
        secondAnswer.layer.cornerRadius = 20.0
        
        thirdAnswer.layer.borderWidth = 3.0
        thirdAnswer.layer.borderColor = CGColor(red: 108/255, green: 122/255, blue: 157/255, alpha: 1)
        thirdAnswer.tintColor = UIColor(red: 217, green: 224, blue: 236, alpha: 1)
        thirdAnswer.layer.cornerRadius = 20.0
        
        
        progressBar.progress = 0.0
        
       updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
       let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
                
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            
        } else{
            sender.backgroundColor = UIColor.red

        }

        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLbl.text = quizBrain.getQuestionText()
        firstAnswer.setTitle(quizBrain.getAnswers(), for: .normal)
        secondAnswer.setTitle(quizBrain.getAnswers(), for: .normal)
        thirdAnswer.setTitle(quizBrain.getAnswers(), for: .normal)

        progressBar.progress = quizBrain.getProgress()
        scoreCounter.text = String(quizBrain.getScore())
        firstAnswer.backgroundColor = UIColor.clear
        secondAnswer.backgroundColor = UIColor.clear
        thirdAnswer.backgroundColor = UIColor.clear
    }

}


