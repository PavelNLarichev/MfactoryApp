//
//  mainScreenVC.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 10.09.2021.
// https://swiftbook.ru/post/tutorials/pass-data/

import UIKit

class mainScreenVC: UIViewController {

    var countTaskTemp = 0
    
    @IBOutlet weak var countTaskLabel: UILabel!
    
    
    @IBOutlet weak var countTaskSlider: UISlider!{
        didSet {
            countTaskSlider.maximumValue = 19
            countTaskSlider.minimumValue = 1
            countTaskSlider.value = 1
        }
    }
    
    @IBAction func sliderTaskChange(_ sender: UISlider) {
        let countTask = Int(round(sender.value))
        countTaskLabel.text = "\(countTask)"
        countTaskTemp = countTask
    }
    @IBAction func startButton(_ sender: UIButton) {
        let tableVC = TableViewController(numberOfQuestions: countTaskTemp, nibName: "TableViewController", bundle: nil)
 
        tableVC.modalPresentationStyle = .overFullScreen
        tableVC.modalTransitionStyle = self.modalTransitionStyle
        
        self.present(tableVC, animated: true, completion: nil)
        
        // show(tableVC, sender: nil) //идентифкатор Segue
    
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countTaskLabel.text = "\(Int(round(countTaskSlider.value)))"
       
        
    }

  

}
