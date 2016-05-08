//
//  Operators.swift

import Foundation

public func < <T: RawRepresentable where T.RawValue: Comparable>(a: T, b: T) -> Bool {
    return a.rawValue < b.rawValue
}

postfix operator % {}

public postfix func % (percentage: Int) -> Double {
    return Double(percentage) / 100.0
}

postfix operator |? {}
postfix operator |!? {}

public postfix func |? (b: Bool?) -> Bool {
    return b.map { $0 } ?? false
}

public postfix func |!? (b: Bool?) -> Bool {
    return b.map { !$0 } ?? false
}
