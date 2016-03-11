//
//  Operators.swift
//  SUSwiftSugar
//
//  Created by Suguru Kishimoto on 2016/03/11.
//
//

import Foundation

public func < <T: RawRepresentable where T.RawValue: Comparable>(a: T, b: T) -> Bool {
    return a.rawValue < b.rawValue
}