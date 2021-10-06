//
//  TableViewCell.swift
//  xib
//
//  Created by Павел Ларичев on 09.09.2021.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    var task: TaskData?
    
    @IBOutlet weak var isTrueLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func set (object : TaskData){
        self.task = object
        self.questionLabel.text = object.question
        self.questionLabel.textColor = .black
        self.answerTF.backgroundColor = .gray
    
        self.answerTF.text = task?.userAnswer
        
        if task?.isTrue == nil  {
            self.answerTF.backgroundColor = .gray
                } else if task?.isTrue == true {
                    self.answerTF.backgroundColor = .green
                }
        else {
            self.answerTF.backgroundColor = .red
            
        }
        
        answerTF.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                  for: .editingChanged)
  
    }
   
    @objc func textFieldDidChange(_ textField: UITextField) {
        //print(textField.text)
        task?.userAnswer = textField.text
            
        if self.answerTF.text == task?.answer {
            task?.isTrue = true
            //print(task?.isTrue)
            self.answerTF.backgroundColor = .green
                } else {
                    task?.isTrue = false
                    self.answerTF.backgroundColor = .red
                    
                }
            
    }
    
    
}
