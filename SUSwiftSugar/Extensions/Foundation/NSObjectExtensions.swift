//
//  NSObjectExtensions.swift

import Foundation

extension NSObject {
    
    class var className: String {
        return TypeName(self)
    }
    
    var className: String {
        return self.dynamicType.className
    }
    
}
