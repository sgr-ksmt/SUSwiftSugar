//
//  ConvenienceFunctions.swift

import Foundation

func clamp<T: Comparable>(value: T, lower: T, upper: T) -> T {
    return min(max(value, lower), upper)
}

func < <T: RawRepresentable where T.RawValue: Comparable>(a: T, b: T) -> Bool {
    return a.rawValue < b.rawValue
}