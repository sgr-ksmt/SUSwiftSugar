//
//  DictionaryExtensions.swift
//
//  Created by Suguru Kishimoto on 2015/12/06.
//  Copyright © 2015 SFIDANTE Inc. All rights reserved.

import Foundation

extension Dictionary {
    
    func union(with: Dictionary) -> Dictionary {
        var tmp = self
        for (k, v) in with {
            tmp.updateValue(v, forKey: k)
        }
        return tmp
    }
    
}

extension Dictionary where Value: Equatable {
    func allKeysForValue(value: Value) -> [Key] {
        return self.flatMap({ $0.1 == value ? $0.0 : nil })
        //        return self.filter({ $0.1 == value }).map({ $0.0 })
    }
    func keyForValue(value: Value) -> Key? {
        return allKeysForValue(value).first
    }
}


func + <K, V>(lhs: Dictionary<K, V>, rhs: Dictionary<K, V>) -> Dictionary<K, V> {
    return lhs.union(rhs)
}
func += <K, V>(inout lhs: Dictionary<K, V>, rhs: Dictionary<K, V>) {
    lhs = lhs + rhs
}