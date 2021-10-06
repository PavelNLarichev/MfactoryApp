//
//  TaskDataManager.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 30.09.2021.
//

import Foundation
// Модель для парсинга JSON
// MARK: - TaskDataJSON
class TaskDataJSON: Codable {
    let errorCode: Int
    let errorMessage: String
    var result: [Result] 
    
   
}

// MARK: - Result
struct Result: Codable {
    let question: String
    let answer: Int
}


