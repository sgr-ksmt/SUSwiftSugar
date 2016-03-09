//
//  UIColorExtensions.swift
//  SFISwiftExtensions

import Foundation
import UIKit

public typealias RGBAColorSpace = (r: CGFloat, g:CGFloat, b: CGFloat, a: CGFloat)

public func == (lhs: UIColor, rhs: UIColor) -> Bool {
    return lhs.isEqualToColor(rhs)
}

public func != (lhs: UIColor, rhs: UIColor) -> Bool {
    return !(lhs == rhs)
}


public func - (lhs: RGBAColorSpace, rhs: RGBAColorSpace) -> RGBAColorSpace {
    return (rhs.r - lhs.r, rhs.g - lhs.g, rhs.b - lhs.b, rhs.a - lhs.a)
}

public extension UIColor {
    public convenience init(var hexString: String, alpha: CGFloat = 1.0) {
        let prefixes = ["#", "0x", "0X"]
        let prefixesString = prefixes.joinWithSeparator("|")
        let hexRangePattern = "[0-9a-fA-F]"
        let pattern = "^(?:\(prefixesString))?(?:\(hexRangePattern){3}|\(hexRangePattern){6})$"
        let regExp = try! NSRegularExpression(pattern: pattern, options: [])
        
        guard regExp.matchesInString(hexString, options: [], range: NSRange(location: 0, length: hexString.length)).count > 0 else {
            self.init(CGColor: UIColor.clearColor().CGColor)
            return
        }
        prefixes.forEach { hexString <-> ($0, "")}
        
        let scanner = NSScanner(string: hexString)
        var color: UInt32 = 0
        guard scanner.scanHexInt(&color) else {
            self.init(CGColor: UIColor.clearColor().CGColor)
            return
        }
        
        let isHex6 = hexString.length == 6
        let divisor: CGFloat = isHex6 ? 255.0 : 15.0
        let r = CGFloat((color & (isHex6 ? 0xFF0000 : 0xF00)) >> (isHex6 ? 16 : 8)) / divisor
        let g = CGFloat((color & (isHex6 ? 0x00FF00 : 0x0F0)) >> (isHex6 ? 8 : 4)) / divisor
        let b = CGFloat(color & (isHex6 ? 0x0000FF : 0x00F)) / divisor
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

    public var RGBA: RGBAColorSpace {
        var r: CGFloat = 0.0; var g: CGFloat = 0.0; var b: CGFloat = 0.0; var a: CGFloat = 0.0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }
    
    public var hexString: String {
        let rgba = self.RGBA
        let hex = rgba.r * 0x10000 + rgba.g * 0x100 + rgba.b
        return Int(hex).hexString(bitSize: 6, uppercase: false)
    }
    
    /**
    * Inspired by :
    * http://stackoverflow.com/questions/21622129/how-to-compare-two-uicolor-which-have-almost-same-shade-or-range-in-ios
    */
    public func isEqualToColor(color: UIColor, withTolerance t: CGFloat = 0.0) -> Bool {
        let csDiff = self.RGBA - color.RGBA
        return fabs(csDiff.r) <= t && fabs(csDiff.g) <= t && fabs(csDiff.b) <= t && fabs(csDiff.a) <= t
    }
}