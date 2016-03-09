//
//  ConvenienceFunctions.swift

import Foundation

public func clamp<T: Comparable>(value: T, low: T, high: T) -> T {
    return min(max(low, value), high)
}
