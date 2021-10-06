//
//  extensionNavigationBar.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 04.10.2021.
//

import Foundation
import UIKit
extension UINavigationBar {

    func customize() {
        self.backItem?.title = ""
        self.tintColor = UIColor.blue
        self.titleTextAttributes = [ .foregroundColor: UIColor.black ]
        self.shadowImage = UIImage()
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.black
            appearance.shadowColor = .clear
            appearance.titleTextAttributes = [
               // NSAttributedString.Key.font: UIFont.myBoldSystemFont(ofSize: 16),
                NSAttributedString.Key.foregroundColor: UIColor.black
            ]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else if #available(iOS 11.0, *) {
            self.isTranslucent = true
            self.setBackgroundImage(UIImage(), for: .default)

            self.prefersLargeTitles = false
            self.largeTitleTextAttributes = [ .foregroundColor: UIColor.black ]
        } else {
            self.isTranslucent = false

          //  let image = UIImage.colored(by: Colors.color_ED3D05)
            let frame = CGRect(origin: .zero, size: UIScreen.main.bounds.size)
          //  let sizedImage = image.resize(targetFrame: frame)
           // self.setBackgroundImage(sizedImage, for: .default)
        }
    }


}
