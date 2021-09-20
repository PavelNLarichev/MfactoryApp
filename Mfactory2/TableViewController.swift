//
//  TableViewController.swift
//  xib
//
//  Created by Павел Ларичев on 09.09.2021.
//

import UIKit

struct Task {
    var question: String
    var answer: String
   // var isTrue: Bool
   // var attempt: Int
}




class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableQuestion: UITableView!
    var multiplyByTwo = [
        Task(question: "2 × 1 = ", answer: "2"),
        Task(question: "2 × 2 = ", answer: "4"),
        Task(question: "2 × 3 = ", answer: "6"),
        Task(question: "2 × 4 = ", answer: "8"),
        Task(question: "2 × 5 = ", answer: "10"),
        Task(question: "2 × 6 = ", answer: "12"),
        Task(question: "2 × 7 = ", answer: "14"),
        Task(question: "2 × 8 = ", answer: "16"),
        Task(question: "2 × 9 = ", answer: "18"),
        Task(question: "2 × 10 = ", answer: "20"),
        Task(question: "1 × 2 = ", answer: "2"),
        Task(question: "3 × 2 = ", answer: "6"),
        Task(question: "4 × 2 = ", answer: "8"),
        Task(question: "5 × 2 = ", answer: "10"),
        Task(question: "6 × 2 = ", answer: "12"),
        Task(question: "7 × 2 = ", answer: "14"),
        Task(question: "8 × 2 = ", answer: "16"),
        Task(question: "9 × 2 = ", answer: "18"),
        Task(question: "10 × 2 = ", answer: "20"),
    ]
   
  
    var numberOfQuestions: Int?
   
    init(numberOfQuestions: Int, nibName: String?, bundle: Bundle?) {
          self.numberOfQuestions = numberOfQuestions
          super.init(nibName: nibName, bundle: bundle)
      }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfQuestions = self.numberOfQuestions else { return  10}
        return numberOfQuestions
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! TableViewCell
        let object = multiplyByTwo[indexPath.row] // достаем объект массива по indexPath
        cell.backgroundColor = UIColor.clear
        cell.set(object: object)
        
        //---- наполняем таблицу случайными элементами массива
//        guard let object = multiplyByTwo.randomElement() else { return cell}
//         cell.backgroundColor = UIColor.clear
//           cell.set(object: object)
        
        
        // Configure the cell...
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        TableQuestion.delegate = self
        TableQuestion.dataSource = self
        TableQuestion.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "questionCell")

        TableQuestion.backgroundColor = UIColor.clear
        registerForKeybordNotification()
        
        let checkOutButton = UIBarButtonItem(title: "Проверить", style: .plain, target: self, action: #selector(checkOut))
        self.navigationItem.rightBarButtonItem = checkOutButton
        
    }
    deinit{
        removeKeyboardNotification ()
    }

    // -- Добавляем наблюдателя за событиями клавиатуры
    func registerForKeybordNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    //Удаляем наблюдателя за событиями клавиатуры
    func removeKeyboardNotification () {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func kbWillShow(_ notification: Notification){
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue //получаем значение высоты клавиатуры
        TableQuestion.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height + 30, right: 0)
       // TableQuestion.contentOffset = CGPoint(x: 0, y: kbFrameSize.height)
    }
    @objc func kbWillHide(_ notification: Notification){
        TableQuestion.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    @objc func checkOut(){
        //функция проверки задания
    }
   
    
}
