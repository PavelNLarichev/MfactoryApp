//
//  mainScreen.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 16.09.2021.
//

import UIKit

class rootScreen: UIViewController {

    var countTaskTemp = Config.countTask
    var isMixTask = Config.isMixTask
    
    var multiplier = 2 // множитель для заданий
    var networkTaskManager = NetworkTaskManager()
    
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       navigationController?.navigationBar.customize()
        title = "Главная"
        
        textOnBoardLabel.text = multiplyByTwoText
        textOnBoardLabel.setSizeFont(sizeFont: 36)
        textOnBoardLabel.textColor = .white
        
       self.navigationController?.navigationBar.backgroundColor = .clear
       
        
        let settingButton = UIBarButtonItem(title: "Параметры", style: .plain, target: self, action: #selector(tapSettingButton))
      
        self.navigationItem.rightBarButtonItem = settingButton
        
    }
    
    
    @IBOutlet weak var textOnBoardLabel: UILabel!
    
    @IBAction func multiplyByOneButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByOneText
        multiplier = 1
    }
    @IBAction func multiplyByTwoButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByTwoText
        multiplier = 2
    }
    @IBAction func multiplyByThreeButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByThreeText
        multiplier = 3
    }
    @IBAction func multiplyByFourButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByFourText
        multiplier = 4
    }
    @IBAction func multiplyByFiveButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByFiveText
        multiplier = 5
    }
    @IBAction func multiplyBySixButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyBySixText
        multiplier = 6
    }
    @IBAction func multiplyBySevenButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyBySevenText
        multiplier = 7
    }
    @IBAction func multiplyByEightButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByEightText
        multiplier = 8
    }
    @IBAction func multiplyByNineButton(_ sender: UIButton) {
        textOnBoardLabel.text = multiplyByNineText
        multiplier = 9
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        sender.isEnabled = false
        networkTaskManager.fetchSetTasks(forMultiplier: multiplier, countTask: countTaskTemp, isMixTask: isMixTask, completion: {data, message in
            if let data = data {
                DispatchQueue.main.async {
                    let tvc = TableViewController(multiplyBy: data, nibName: "TableViewController", bundle: nil)
                    self.navigationController?.pushViewController(tvc, animated: true)
                    sender.isEnabled = true
                }

            }
        })


    }
    
    
    
    
    
    
    
    
    
    @objc func tapSettingButton() {
        let msvc = mainScreenVC()
        msvc.setCountTaskTempForRootScreen = { [weak self] count in
            print("Кол-во заданий, которое выбрали: \(count)")
            self?.countTaskTemp = count
            msvc.navigationController?.popViewController(animated: true)
        }
        
        msvc.setIsMixTaskForRootScreen = { [weak self] isMixTask in
            print("Перемешивать вопросы: \(isMixTask)")
            self?.isMixTask = isMixTask
            msvc.navigationController?.popViewController(animated: true)
        }
        
        self.navigationController?.pushViewController(msvc, animated: true)
    }
    
    
    
}
