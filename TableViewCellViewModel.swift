//
//  TableViewCellViewModel.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 23.11.2021.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
 
    private var task: TaskData
   
    var question: String {
        return task.question
    }
    var answer: String {
        return task.answer
    }
    
    init(task: TaskData) {
        self.task = task
        
        // вот тут я не понял, почему какие-то геттеры напрямую берут данные из task, а какие-то надо сетить
        // сделал вот так, чтобы соответстовать протоколу TableViewCellViewModelType
        userAnswer = task.userAnswer
        
        if let userAnswer = userAnswer {
            isTrue = userAnswer == task.answer
        } else {
            isTrue = nil
        }
    }
    
    var userAnswer: String?
   
    var isTrue: Bool?
    
}
