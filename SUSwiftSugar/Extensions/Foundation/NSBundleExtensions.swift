//
//  NSBundleExtensions.swift

import Foundation

public extension NSBundle {
    public func applicationVersion() -> String {
        return objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
    }
    public func applicationBuildNumber() -> String {
        return objectForInfoDictionaryKey("CFBundleVersion") as! String
    }
}