//
//  UIFontExtensions.swift
//  SUSwiftSugar
//
//  Created by Suguru Kishimoto on 2016/03/08.
//
//

import Foundation
import UIKit

public extension UIFont {
    public class func allFontNames() -> [String] {
        return familyNames().flatMap(fontNamesForFamilyName).sort()
    }
    
    public func changeFontSize(size: CGFloat) -> UIFont {
        return UIFont(name: self.fontName, size: size)!
    }
}