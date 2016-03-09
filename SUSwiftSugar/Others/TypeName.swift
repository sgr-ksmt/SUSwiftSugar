//
//  TypeName.swift

import Foundation

public func TypeName<T: Any>(type: T.Type) -> String {
    return String(type)
}

public func FullTypeName<T: Any>(type: T.Type) -> String {
    return String(reflecting: type)
}