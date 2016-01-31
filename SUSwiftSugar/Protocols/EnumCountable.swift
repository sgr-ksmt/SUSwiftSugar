//
//  EnumCountable.swift

import Foundation

class EnumGenerator<Enum : Hashable> : GeneratorType {
    
    var rawEnum = 0
    var done = false
    
    func next() -> Enum? {
        if done { return nil }
        
        let enumCase = withUnsafePointer(&rawEnum) { UnsafePointer<Enum>($0).memory }
        if enumCase.hashValue == rawEnum {
            rawEnum++
            return enumCase
        } else {
            done = true
            return nil
        }
    }
    
}

class SingleEnumGenerator<Enum : Hashable> : EnumGenerator<Enum> {
    
    override func next() -> Enum? {
        return done ? nil : { done = true; return unsafeBitCast((), Enum.self) }()
    }
    
}

struct EnumSequence<Enum : Hashable> : SequenceType {
    
    func generate() -> EnumGenerator<Enum> {
        switch sizeof(Enum) {
        case 0: return SingleEnumGenerator()
        default: return EnumGenerator()
        }
    }
    
}

protocol EnumCountable {
    typealias Element = Self
}

extension EnumCountable where Element: Hashable {
    
    static func elements() -> [Element] {
        return Array(EnumSequence())
    }
    
    static var count: Int {
        return elements().count
    }
    
}
