//
//  Question.swift
//  Quizzer
//
//  Created by Rustin Wilde on 22.05.23.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
    

}
