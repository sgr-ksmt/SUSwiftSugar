//
//  NSBundleExtensions.swift

import Foundation

extension NSBundle {
    
    func applicationVersion() -> String {
        return self.objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
    }
    
    func applicationBuildNumber() -> String {
        return self.objectForInfoDictionaryKey("CFBundleVersion") as! String
    }
    
}