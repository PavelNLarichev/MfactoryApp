//
//  Task.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 30.09.2021.

// Модель для зашитых заданий

import Foundation
class TaskData {
    
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


