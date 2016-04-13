//
//  EnhancedErrorType.swift

import Foundation

public protocol EnhancedErrorType: ErrorType, CustomStringConvertible {
    var domain: String { get }
    var code: Int { get }
    var userInfo: [NSObject: AnyObject]? { get }
}

public extension EnhancedErrorType {
    var _domain: String {
        return domain
    }
    
    var _code: Int {
        return code
    }
    
    public var domain: String {
        return String(reflecting: self.dynamicType)
    }
    
    public var code: Int {
        return 0
    }
    
    public var userInfo: [NSObject: AnyObject]? {
        return nil
    }
    
    public func toNSError() -> NSError {
        return NSError(domain: domain, code: code, userInfo: userInfo)
    }
    
    public var description: String {
        return "\(toNSError())"
    }
}