//
//  NSObjectExtensions.swift

import Foundation

public extension NSObject {
    public static var className: String {
        return TypeName(self)
    }
    
    public var className: String {
        return self.dynamicType.className
    }
}
