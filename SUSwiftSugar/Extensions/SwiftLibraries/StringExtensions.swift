//
//  StringExtensions.swift

import Foundation

infix operator <-> {}
public func <-> (inout lhs: String, rhs: (String,String)) {
    lhs.replace(rhs.0, withString: rhs.1)
}

infix operator <> { associativity left precedence 145 }
public func <> (lhs: String, rhs: (String,String)) -> String {
    return lhs.replacedString(rhs.0, withString: rhs.1)
}

public func * (lhs: String, rhs: Int) -> String {
    return Array(count: max(0, rhs), repeatedValue: lhs).joinWithSeparator("")
}

public extension String {
    
    private var ns: NSString {
        return (self as NSString)
    }
    
    public func substringFromIndex(index: Int) -> String {
        return ns.substringFromIndex(index)
    }
    
    public func substringToIndex(index: Int) -> String {
        return ns.substringToIndex(index)
    }
    
    public func substringWithRange(range: NSRange) -> String {
        return ns.substringWithRange(range)
    }
    
    public var lastPathComponent: String {
        return ns.lastPathComponent
    }
    
    public var pathExtension: String {
        return ns.pathExtension
    }
    
    public var stringByDeletingLastPathComponent: String {
        return ns.stringByDeletingLastPathComponent
    }
    
    public var stringByDeletingPathExtension: String {
        return ns.stringByDeletingPathExtension
    }
    
    public var pathComponents: [String] {
        return ns.pathComponents
    }
    
    public var length: Int {
        return characters.count
    }
    
    public var range: NSRange {
        return NSRange(location: 0,length: length)
    }
    
    public func stringByAppendingPathComponent(path: String) -> String {
        return ns.stringByAppendingPathComponent(path)
    }
    
    public func stringByAppendingPathExtension(ext: String) -> String? {
        return ns.stringByAppendingPathExtension(ext)
    }
    
}

public extension String {

    public subscript (var index: Int) -> Character {
        let distance = startIndex.distanceTo(endIndex)
        index %= distance
        if index < 0 { index += distance }
        return self[startIndex.advancedBy(index)]
    }
    
    public subscript(range: Range<Int>) -> String {
        let start = startIndex.advancedBy(range.startIndex)
        let end   = startIndex.advancedBy(range.endIndex)
        return self[start..<end]
    }
}

public extension String {
    
    public var isBlank: Bool {
        let set = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        return stringByTrimmingCharactersInSet(set).isEmpty
    }
    
    public func contains(target: String, compareOption: NSStringCompareOptions = []) -> Bool {
        return rangeOfString(target, options: compareOption) != nil
    }
    
    public mutating func replace(target: String, withString: String) {
        self = replacedString(target, withString: withString)
    }
    
    @warn_unused_result
    public func replacedString(target: String, withString: String) -> String {
        return stringByReplacingOccurrencesOfString(target, withString: withString)
    }
    
}

// certain unicode count
// ref: http://qiita.com/miyakeryo/items/60b00c7541db9fa2182b
public extension String {
    public func unicodeCount() -> Int {
        var biCount = 0
        for c in self.unicodeScalars {
            switch c.value {
                // Combining Diacritical Marks for Symbols
            case 0x20D0...0x20FF:
                break
                // Variation Selectors
            case 0xFE00...0xFE0F:
                break
                // Regional Indicator symbols
            case 0x1F1E6...0x1F1FF:
                biCount += 1
                // Fitzpatrick skin type
            case 0x1F3FB...0x1F3FF:
                break
            default:
                biCount += 2
            }
        }
        return biCount / 2
    }
}