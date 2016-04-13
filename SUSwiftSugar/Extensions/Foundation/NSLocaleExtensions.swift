//
//  NSLocaleExtensions.swift

import Foundation

public extension NSLocale {
    public enum LocaleType: String {
        case en_US_POSIX
        case en_US
        case ja_JP
        case fr_FR
        case de_DE
    }
    public convenience init(type: LocaleType) {
        self.init(localeIdentifier: type.rawValue)
    }
}