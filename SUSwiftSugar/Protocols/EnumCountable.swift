//
//  EnumCountable.swift

import Foundation

public protocol EnumEnumerable {
    associatedtype Case = Self
}

public extension EnumEnumerable where Case: Hashable {
    private static var generator: AnyGenerator<Case> {
        var n = 0
        return AnyGenerator {
            defer { n += 1 }
            let next = withUnsafePointer(&n) { UnsafePointer<Case>($0).memory }
            return next.hashValue == n ? next : nil
        }
    }
    
    @warn_unused_result
    public static func enumerate() -> EnumerateSequence<AnySequence<Case>> {
        return AnySequence(generator).enumerate()
    }
    
    public static var cases: [Case] {
        return Array(generator)
    }
    
    public static var count: Int {
        return cases.count
    }
}