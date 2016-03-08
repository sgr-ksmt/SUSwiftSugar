//
//  StringExtensions.swift

import Foundation

infix operator <-> {}
func <-> (inout lhs: String, rhs: (String,String)) {
    lhs.replace(rhs.0, withString: rhs.1)
}

infix operator <> { associativity left precedence 145 }
func <> (lhs: String, rhs: (String,String)) -> String {
    return lhs.replacedString(rhs.0, withString: rhs.1)
}

func * (lhs: String, rhs: Int) -> String {
    return Array(count: max(0, rhs), repeatedValue: lhs).joinWithSeparator("")
}

extension String {
    
    private var ns: NSString {
        return (self as NSString)
    }
    
    func substringFromIndex(index: Int) -> String {
        return ns.substringFromIndex(index)
    }
    
    func substringToIndex(index: Int) -> String {
        return ns.substringToIndex(index)
    }
    
    func substringWithRange(range: NSRange) -> String {
        return ns.substringWithRange(range)
    }
    
    var lastPathComponent: String {
        return ns.lastPathComponent
    }
    
    var pathExtension: String {
        return ns.pathExtension
    }
    
    var stringByDeletingLastPathComponent: String {
        return ns.stringByDeletingLastPathComponent
    }
    
    var stringByDeletingPathExtension: String {
        return ns.stringByDeletingPathExtension
    }
    
    var pathComponents: [String] {
        return ns.pathComponents
    }
    
    var length: Int {
        return characters.count
    }
    
    var range: NSRange {
        return NSMakeRange(0, length)
    }
    
    func stringByAppendingPathComponent(path: String) -> String {
        return ns.stringByAppendingPathComponent(path)
    }
    
    func stringByAppendingPathExtension(ext: String) -> String? {
        return ns.stringByAppendingPathExtension(ext)
    }
    
}

extension String {

    subscript (var index: Int) -> Character {
        let distance = startIndex.distanceTo(self.endIndex)
        index %= distance
        if index < 0 { index += distance }
        return self[self.startIndex.advancedBy(index)]
    }
    
    subscript(range: Range<Int>) -> String {
        let start = startIndex.advancedBy(range.startIndex)
        let end   = startIndex.advancedBy(range.endIndex)
        return self[start..<end]
    }
}

extension String {
    
    var isBlank: Bool {
        let set = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        return self.stringByTrimmingCharactersInSet(set).isEmpty
    }
    
    func contains(target: String, compareOption: NSStringCompareOptions = []) -> Bool {
        return self.rangeOfString(target, options: compareOption) != nil
    }
    
    mutating func replace(target: String, withString: String) {
        self = self.replacedString(target, withString: withString)
    }
    
    @warn_unused_result
    func replacedString(target: String, withString: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: withString)
    }
    
}

// certain unicode count
// ref: http://qiita.com/miyakeryo/items/60b00c7541db9fa2182b
extension String {
    func unicodeCount() -> Int {
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
        return biCount/2
    }
}