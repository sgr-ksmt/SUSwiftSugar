//
//  Operators.swift

import Foundation

public func < <T: RawRepresentable where T.RawValue: Comparable>(a: T, b: T) -> Bool {
    return a.rawValue < b.rawValue
}

postfix operator % {}

postfix func % (percentage: Int) -> Double {
    return Double(percentage) / 100.0
}

postfix operator |? {}
postfix operator |!? {}

postfix func |? (b: Bool?) -> Bool {
    return b.map { $0 } ?? false
}
postfix func |!? (b: Bool?) -> Bool {
    return b.map { !$0 } ?? false
}
