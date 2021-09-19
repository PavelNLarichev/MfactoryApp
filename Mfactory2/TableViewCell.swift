//
//  TableViewCell.swift
//  xib
//
//  Created by Павел Ларичев on 09.09.2021.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    var task: Task?
    
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
    func set (object : Task){
        self.task = object
        //self.isTrueLabel.text = "?"
        self.questionLabel.text = object.question
        self.answerTF.backgroundColor = .gray
    
        self.answerTF.text = ""
        answerTF.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                  for: .editingChanged)
    }
   
    @objc func textFieldDidChange(_ textField: UITextField) {
        //print(textField.text)
        
            
        if self.answerTF.text == task?.answer {
            //print(countTrueAnswer)
                //self.isTrueLabel.text = "🟢"
            self.answerTF.backgroundColor = .green
                } else {
                   // self.isTrueLabel.text = "🔴"
                    self.answerTF.backgroundColor = .red
                }
            
    }
    
    
}
