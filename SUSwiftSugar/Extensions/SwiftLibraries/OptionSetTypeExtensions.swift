//
//  OptionSetTypeExtensions.swift

import Foundation

public func & <T: OptionSetType where T.RawValue : BitwiseOperationsType>(lhs: T, rhs: T) -> T {
    return T(rawValue: lhs.rawValue & rhs.rawValue)
}

public func | <T: OptionSetType where T.RawValue : BitwiseOperationsType>(lhs: T, rhs: T) -> T {
    return T(rawValue: lhs.rawValue | rhs.rawValue)
}

public func ^ <T: OptionSetType where T.RawValue : BitwiseOperationsType>(lhs: T, rhs: T) -> T {
    return T(rawValue: lhs.rawValue ^ rhs.rawValue)
}

public func &= <T: OptionSetType where T.RawValue : BitwiseOperationsType>(inout lhs: T, rhs: T) {
    lhs = lhs & rhs
}

public func |= <T: OptionSetType where T.RawValue : BitwiseOperationsType>(inout lhs: T, rhs: T) {
    lhs = lhs | rhs
}

public func ^= <T: OptionSetType where T.RawValue : BitwiseOperationsType>(inout lhs: T, rhs: T) {
    lhs = lhs ^ rhs
}

public prefix func ~ <T: OptionSetType where T.RawValue : BitwiseOperationsType>(type: T) -> T {
    return T(rawValue: ~type.rawValue)
}
