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


public func +<K, V>(lhs: Dictionary<K, V>, rhs: Dictionary<K, V>) -> Dictionary<K, V> {
    return lhs.union(rhs)
}
public func +=<K, V>(inout lhs: Dictionary<K, V>, rhs: Dictionary<K, V>) {
    lhs = lhs + rhs
}