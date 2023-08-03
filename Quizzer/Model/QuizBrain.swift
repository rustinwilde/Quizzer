//
//  QuizBrain.swift
//  Quizzer
//
//  Created by Rustin Wilde on 28.05.23.
//

import UIKit


struct QuizBrain {
    
    var questionNumber = 0
    var answerNumber = 0
    var counter = 0
    var answer: String!

    let questions = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
]
    
    
    mutating func checkAnswer(_ userAnswer : String) -> Bool {
        if userAnswer == questions[questionNumber].correctAnswer {
            counter += 1
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
        return counter
    }
    
    
    func getQuestionText() -> String {
        return questions[questionNumber].text
    }
    
    func getProgress() -> Float{
        let remainingProgress = Float(questionNumber + 1) / Float(questions.count)
        return remainingProgress
    }
    
    mutating func nextQuestion() {
        if questionNumber < questions.count - 1{
            self.questionNumber += 1
            
        } else {
            questionNumber = 0
            counter = 0
        }
    }
    
    mutating   func getAnswers() -> String {
        print("1. \(answerNumber)")
        if answerNumber <= 2{
            answer = questions[self.questionNumber].answer[answerNumber]
            answerNumber += 1
            
            if answerNumber == 3 {
                answerNumber = 0
                print("\(answerNumber)\n")
            }
        }
        return answer
        
    }
    
    
    
}
