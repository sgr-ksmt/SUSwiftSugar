//
//  IntExtensions.swift

import Foundation

// MARK: - convenience computed properties
extension Int {
    
    var isPositive: Bool { return self >= 0 }
    
    var isNegative: Bool { return self < 0 }
    
    var isEven: Bool { return self % 2 == 0 }
    
    var isOdd: Bool { return self % 2 != 0 }
}

// MARK: - convert to binary, hex string
extension Int {
    private func zeroPadding(string: String, padSize: Int) -> String {
        return "0" * Swift.max(0, padSize - string.length) + string
    }

    func binaryString(bitSize bitSize: Int = 1) -> String {
        return zeroPadding(String(self, radix: 2),padSize: bitSize)
    }
    func hexString(bitSize bitSize: Int = 1, cap: Bool = false, uppercase: Bool = false) -> String {
        var hex = String(self, radix: 16)
        if uppercase { hex = hex.uppercaseString }
        return (cap ? "0x" : "") + zeroPadding(hex,padSize: bitSize)
    }
}

// MARK: - times like ruby `times`
extension Int {
    
    func times(@noescape block: (Int) -> Void) {
        if self<=0{return};for i in 0..<self{block(i)}
    }
    
}