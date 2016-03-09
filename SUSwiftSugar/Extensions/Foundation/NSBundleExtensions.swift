//
//  NSBundleExtensions.swift

import Foundation

extension NSBundle {
    func applicationVersion() -> String {
        return objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
    }
    func applicationBuildNumber() -> String {
        return objectForInfoDictionaryKey("CFBundleVersion") as! String
    }
}