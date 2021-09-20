//
//  extension.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 20.09.2021.
//

import UIKit

extension UILabel {
    func setSizeFont (sizeFont: Double) {
        self.font =  UIFont(name: self.font.fontName, size: CGFloat(sizeFont))!
        self.sizeToFit()
    }
    
}
