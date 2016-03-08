//
//  NSLocaleExtensions.swift
//  SUSwiftSugar
//
//  Created by Suguru Kishimoto on 2016/03/08.
//
//

import Foundation

extension NSLocale {
    enum Type: String {
        case en_US_POSIX
        case en_US
        case ja_JP
        case fr_FR
        case de_DE
    }
    convenience init(type: Type) {
        self.init(localeIdentifier: type.rawValue)
    }
}