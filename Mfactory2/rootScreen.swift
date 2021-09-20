//
//  mainScreen.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 16.09.2021.
//

import UIKit

class rootScreen: UIViewController {

    
    
    @IBAction func multiplyByOneButton(_ sender: Any) {
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        let tvc = TableViewController(numberOfQuestions: 10, nibName: "TableViewController", bundle: nil)
        self.navigationController?.pushViewController(tvc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главная"

        self.navigationController?.navigationBar.backgroundColor = .clear
//        let tvc = TableViewController(numberOfQuestions: 10, nibName: "TableViewController", bundle: nil)
//        self.navigationController?.pushViewController(tvc, animated: true)
       
        
        let settingButton = UIBarButtonItem(title: "Настройки", style: .plain, target: self, action: #selector(tapSettingButton))
        //let settingButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(tapSettingButton))
        self.navigationItem.rightBarButtonItem = settingButton
        
    }
    @objc func tapSettingButton() {
        let msvc = mainScreenVC()
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
