//
//  TableViewCell.swift
//  xib
//
//  Created by Павел Ларичев on 09.09.2021.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    var task: TaskData?
    
    var onUserAnswerChanged: ((_ userAnswer: String?) -> Void)?
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard  let viewModel = viewModel else { return }
            
            self.questionLabel.textColor = .black
            self.answerTF.backgroundColor = .gray
            questionLabel.text = viewModel.question
            answerTF.text = viewModel.userAnswer
            
            if let isTrue = viewModel.isTrue {
                self.answerTF.backgroundColor = isTrue ? .green : .red
            } else {
                self.answerTF.backgroundColor = .gray
            }
            
        }
    }
    
    @IBAction @objc func textFieldDidChange(_ textField: UITextField) {
        onUserAnswerChanged?(textField.text)
        
    }
}
