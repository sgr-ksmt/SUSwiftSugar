//
//  DictionaryExtensions.swift

import Foundation

public extension Dictionary {
    public func union(with: Dictionary) -> Dictionary {
        var tmp = self
        with.forEach {
            tmp.updateValue($0.1, forKey: $0.0)
        }
        return tmp
    }
}

public extension Dictionary where Value: Equatable {
    public func allKeysForValue(value: Value) -> [Key] {
        return self.flatMap { $0.1 == value ? $0.0 : nil }
    }
    
    public func keyForValue(value: Value) -> Key? {
        return allKeysForValue(value).first
    }
}


func + <K, V>(lhs: [K: V], rhs: [K: V]) -> [K: V] {
    return lhs.union(rhs)
}

func += <K, V>(inout lhs: [K: V], rhs: [K: V]) {
    lhs = lhs + rhs
}

func + <K, V>(lhs: [K: V]?, rhs: [K: V]?) -> [K: V]? {
    switch (lhs, rhs) {
    case (.Some(let l), .Some(let r)):
        return l + r
    case (.Some(let l), .None):
        return l
    case (.None, .Some(let r)):
        return r
    default:
        return nil
    }
}

func += <K, V>(inout lhs: [K: V]?, rhs: [K: V]?) {
    lhs = lhs + rhs
}
