//
//  mainScreen.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 16.09.2021.
//

import UIKit

class rootScreen: UIViewController {
    
    var countTaskTemp = 5 //количество вопросов по умолчанию. в эту переменную приходит значение с экрана Параметры
    
    
    
    @IBOutlet weak var textOnBoardLabel: UILabel!
    
    
    @IBAction func multiplyByOneButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByOneText
    }
    
    @IBAction func multiplyByTwoButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByTwoText
    }
    
    @IBAction func multiplyByThreeButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByThreeText
    }
    
    @IBAction func multiplyByFourButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByFourText
    }
    
    @IBAction func multiplyByFiveButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByFiveText
    }
    
    @IBAction func multiplyBySixButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyBySixText
    }
    @IBAction func multiplyBySevenButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyBySevenText
    }
    @IBAction func multiplyByEightButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByEightText
    }
    
    @IBAction func multiplyByNineButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByNineText
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        
        let tvc = TableViewController(numberOfQuestions: countTaskTemp, nibName: "TableViewController", bundle: nil)
        self.navigationController?.pushViewController(tvc, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главная"
        textOnBoardLabel.text = multiplyByTwoText
       textOnBoardLabel.setSizeFont(sizeFont: 24)
        textOnBoardLabel.textColor = .white
        
        self.navigationController?.navigationBar.backgroundColor = .clear
        //        let tvc = TableViewController(numberOfQuestions: 10, nibName: "TableViewController", bundle: nil)
        //        self.navigationController?.pushViewController(tvc, animated: true)
        
        
        let settingButton = UIBarButtonItem(title: "Параметры", style: .plain, target: self, action: #selector(tapSettingButton))
        //let settingButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(tapSettingButton))
        self.navigationItem.rightBarButtonItem = settingButton
        
    }
    @objc func tapSettingButton() {
        let msvc = mainScreenVC()
        msvc.result = { [weak self] count in
            print("Кол-во заданий, которое выбрали: \(count)")
            self?.countTaskTemp = count
            msvc.navigationController?.popViewController(animated: true)
        }
        
        self.navigationController?.pushViewController(msvc, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
