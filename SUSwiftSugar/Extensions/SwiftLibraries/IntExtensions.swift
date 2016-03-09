//
//  IntExtensions.swift

import Foundation

// MARK: - convenience computed properties
public extension Int {
    public var isPositive: Bool { return self >= 0 }
    public var isNegative: Bool { return self < 0 }
    public var isEven: Bool { return self % 2 == 0 }
    public var isOdd: Bool { return self % 2 != 0 }
}

// MARK: - convert to binary, hex string
public extension Int {
    private func zeroPadding(string: String, padSize: Int) -> String {
        return "0" * Swift.max(0, padSize - string.length) + string
    }

    public func binaryString(bitSize bitSize: Int = 1) -> String {
        return zeroPadding(String(self, radix: 2),padSize: bitSize)
    }
    public func hexString(bitSize bitSize: Int = 1, cap: Bool = false, uppercase: Bool = false) -> String {
        var hex = String(self, radix: 16)
        if uppercase { hex = hex.uppercaseString }
        return (cap ? "0x" : "") + zeroPadding(hex,padSize: bitSize)
    }
}

// MARK: - times like ruby `times`
public extension Int {
    public func times(@noescape block: Int -> Void) {
        (0..<(self > 0 ? self : 0)).forEach(block)
    }
}