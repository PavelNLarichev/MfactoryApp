//
//  mainScreenVC.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 10.09.2021.
// https://swiftbook.ru/post/tutorials/pass-data/

import UIKit

class mainScreenVC: UIViewController {

    var countTaskTemp = Config.countTask
    var isMixTask = Config.isMixTask
    
    @IBOutlet weak var countTaskLabel: UILabel!
    
    @IBOutlet weak var mixTaskLabel: UILabel!
    
    @IBOutlet weak var mixTaskSwitch: UISwitch!
    
    @IBOutlet weak var countTaskSlider: UISlider!{
        didSet {
            countTaskSlider.maximumValue = 19
            countTaskSlider.minimumValue = 1
            countTaskSlider.value = 10
        }
    }
    

    
    @IBAction func mixTaskSwitch(_ sender: UISwitch) {
        isMixTask = 1
        print(isMixTask)
    }
    // Замыкание, которое будем вызывать на экране с которого отображаем этот экран
    var setCountTaskTempForRootScreen: ((Int) -> Void)?
    var setIsMixTaskForRootScreen:((Int) -> Void)?
    
    @IBAction func sliderTaskChange(_ sender: UISlider) {
        let countTask = Int(round(sender.value))
        countTaskLabel.text = "\(countTask)"
        countTaskTemp = countTask
    }
    @IBAction func startButton(_ sender: UIButton) { //кнопка Сохранить
        setCountTaskTempForRootScreen?(countTaskTemp)
        setIsMixTaskForRootScreen?(isMixTask)
            }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countTaskLabel.text = "\(Int(round(countTaskSlider.value)))"
      title = "Параметры"
        
    }

  

}
