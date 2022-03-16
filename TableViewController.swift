//
//  TableViewController.swift
//  xib
//
//  Created by Павел Ларичев on 09.09.2021.
//

import UIKit


class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var questionsTable: UITableView!

    
    var  multiplyBy = [TaskData]()


    
    init(multiplyBy: [TaskData], nibName: String?, bundle: Bundle?) {
        self.multiplyBy = multiplyBy
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return multiplyBy.count    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as? TableViewCell

        guard let tabelViewCell = cell else {
            return UITableViewCell()
        }

        let task = multiplyBy[indexPath.row]
        let cellViewModel = TableViewCellViewModel(task: task)

        tabelViewCell.viewModel = cellViewModel
        
        tabelViewCell.onUserAnswerChanged = { userAnswer in
            task.userAnswer = userAnswer
            cellViewModel.userAnswer = userAnswer
            
            // Заметка: вместо этого наверное можно поле isTrue сделать генерируемым, по данным из viewModel
            if
                let userAnswer = userAnswer,
                userAnswer != ""
            {
                cellViewModel.isTrue = userAnswer == task.answer
            } else {
                cellViewModel.isTrue = nil
            }
            
            // обновляем ячейку
            tabelViewCell.viewModel = cellViewModel
        }

        return tabelViewCell
    }
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()

        questionsTable.delegate = self
        questionsTable.dataSource = self
        questionsTable.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "questionCell")
        questionsTable.backgroundColor = UIColor.clear
        //кнопка "Проверить"
//        let checkOutButton = UIBarButtonItem(title: "Проверить", style: .plain, target: self, action: #selector(checkOut))
//        self.navigationItem.rightBarButtonItem = checkOutButton
        
        registerForKeybordNotification()
    
       
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
        questionsTable.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height + 30, right: 0)
        // TableQuestion.contentOffset = CGPoint(x: 0, y: kbFrameSize.height)
    }
    @objc func kbWillHide(_ notification: Notification){
        questionsTable.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    @objc func checkOut(){
        print("молодец")
        
        
    }
    
    
}
