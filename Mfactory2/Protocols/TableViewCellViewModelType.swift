//
//  TableViewCellViewModelType.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 23.11.2021.
//

import Foundation

protocol TableViewCellViewModelType: AnyObject {
    var question: String { get }
    var answer: String { get }
    var userAnswer: String? { get set }
    var isTrue: Bool? { get set }
}
