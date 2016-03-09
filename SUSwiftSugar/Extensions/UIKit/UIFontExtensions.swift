//
//  UIFontExtensions.swift
//  SUSwiftSugar
//
//  Created by Suguru Kishimoto on 2016/03/08.
//
//

import Foundation
import UIKit

extension UIFont {
    class func allFontNames() -> [String] {
        return UIFont.familyNames().flatMap(UIFont.fontNamesForFamilyName).sort()
    }
    
    func changeFontSize(size: CGFloat) -> UIFont {
        return UIFont(name: self.fontName, size: size)!
    }
}