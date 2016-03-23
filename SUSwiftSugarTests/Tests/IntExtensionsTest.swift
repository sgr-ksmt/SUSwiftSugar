//
//  IntExtensionsTest.swift

import XCTest
import SUSwiftSugar

class IntExtensionsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_computed_properties() {
        let num1 = 3
        let num2 = 8
        let num3 = -5
        let num4 = -12
        
        XCTAssertTrue(num1.isPositive)
        XCTAssertFalse(num1.isNegative)
        XCTAssertTrue(num1.isOdd)
        XCTAssertFalse(num1.isEven)
        
        XCTAssertTrue(num2.isPositive)
        XCTAssertFalse(num2.isNegative)
        XCTAssertFalse(num2.isOdd)
        XCTAssertTrue(num2.isEven)

        XCTAssertFalse(num3.isPositive)
        XCTAssertTrue(num3.isNegative)
        XCTAssertTrue(num3.isOdd)
        XCTAssertFalse(num3.isEven)

        XCTAssertFalse(num4.isPositive)
        XCTAssertTrue(num4.isNegative)
        XCTAssertFalse(num4.isOdd)
        XCTAssertTrue(num4.isEven)

    }
    
    func test_convert_hex_string() {
        let num = 483
        XCTAssertEqual(num.hexString(), "1e3")
        XCTAssertEqual(num.hexString(bitSize: 8), "000001e3")
        XCTAssertEqual(num.hexString(cap: true), "0x1e3")
        XCTAssertEqual(num.hexString(bitSize: 8, cap: true), "0x000001e3")
        
        XCTAssertEqual(num.hexString(uppercase: true), "1E3")
        XCTAssertEqual(num.hexString(bitSize: 8, uppercase: true), "000001E3")
        XCTAssertEqual(num.hexString(cap: true, uppercase: true), "0x1E3")
        XCTAssertEqual(num.hexString(bitSize: 8, cap: true, uppercase: true), "0x000001E3")
    }
    
    func test_convert_bin_string() {
        let num = 483
        XCTAssertEqual(num.binaryString(), "111100011")
        XCTAssertEqual(num.binaryString(bitSize: 16), "0000000111100011")
    }

    func test_times() {
        var result = ""
        10.times { _ in result += "a" }
        XCTAssertEqual(result, "a" * 10)
    }
}
