//
//  Task.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 30.09.2021.
//

import Foundation
class Task {
    var question: String
    var answer: String
    var userAnswer: String?
    var isTrue: Bool?
    // var attempt: Int
    init (question: String, answer: String){
        self.question = question
        self.answer =  answer
        
    }
}
