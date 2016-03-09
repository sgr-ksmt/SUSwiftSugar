//
//  EnhancedErrorType.swift
//  SUSwiftSugar
//
//  Created by Suguru Kishimoto on 2016/03/09.
//
//

import Foundation

public protocol EnhancedErrorType: ErrorType, CustomStringConvertible {
    var domain: String { get }
    var code: Int { get }
    var userInfo: [NSObject: AnyObject]? { get }
}

extension EnhancedErrorType {
    var _domain: String {
        return domain
    }
    
    var _code: Int {
        return code
    }
    
    var domain: String {
        return String(reflecting: self.dynamicType)
    }
    
    var code: Int {
        return 0
    }
    
    var userInfo: [NSObject: AnyObject]? {
        return nil
    }
    
    public func toNSError() -> NSError {
        return NSError(domain: domain, code: code, userInfo: userInfo)
    }
    
    var description: String {
        return "\(toNSError())"
    }
}