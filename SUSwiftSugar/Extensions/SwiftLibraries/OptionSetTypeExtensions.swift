//
//  OptionSetTypeExtensions.swift

import Foundation

//TODO: Test
func & <T: OptionSetType where T.RawValue : BitwiseOperationsType>(lhs: T, rhs: T) -> T {
    return T(rawValue: lhs.rawValue & rhs.rawValue)
}

func | <T: OptionSetType where T.RawValue : BitwiseOperationsType>(lhs: T, rhs: T) -> T {
    return T(rawValue: lhs.rawValue | rhs.rawValue)
}

func ^ <T: OptionSetType where T.RawValue : BitwiseOperationsType>(lhs: T, rhs: T) -> T {
    return T(rawValue: lhs.rawValue ^ rhs.rawValue)
}

func &= <T: OptionSetType where T.RawValue : BitwiseOperationsType>(inout lhs: T, rhs: T) {
    lhs = lhs & rhs
}

func |= <T: OptionSetType where T.RawValue : BitwiseOperationsType>(inout lhs: T, rhs: T) {
    lhs = lhs | rhs
}

func ^= <T: OptionSetType where T.RawValue : BitwiseOperationsType>(inout lhs: T, rhs: T) {
    lhs = lhs ^ rhs
}

prefix func ~ <T: OptionSetType where T.RawValue : BitwiseOperationsType>(type: T) -> T {
    return T(rawValue: ~type.rawValue)
}
