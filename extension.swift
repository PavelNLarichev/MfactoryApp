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
        self.font = UIFont .boldSystemFont(ofSize: CGFloat(sizeFont))
        self.sizeToFit()
    }
    
}

//extension UILabel {
//
//
//
//    func fitFontForSize(minFontSize : CGFloat = 5.0, maxFontSize : CGFloat = 300.0, accuracy : CGFloat = 1.0) {
//        assert(maxFontSize > minFontSize)
//        layoutIfNeeded() // Can be removed at your own discretion
//        let constrainedSize = bounds.size
//        while maxFontSize - minFontSize > accuracy {
//            let midFontSize : CGFloat = ((minFontSize + maxFontSize) / 2)
//            font = font.withSize(midFontSize)
//            sizeToFit()
//            let checkSize : CGSize = bounds.size
//            if  checkSize.height < constrainedSize.height && checkSize.width < constrainedSize.width {
//               let minFontSize = midFontSize
//            } else {
//                let maxFontSize = midFontSize
//            }
//        }
//        font = font.withSize(minFontSize)
//        sizeToFit()
//        layoutIfNeeded() // Can be removed at your own discretion
//    }

//}
