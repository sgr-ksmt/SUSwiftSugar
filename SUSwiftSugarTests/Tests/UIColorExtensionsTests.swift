//
//  UIColorExtensionsTests.swift

import XCTest
import SUSwiftSugar

class UIColorExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_equal_operator() {
        XCTAssertTrue(UIColor.blackColor() == UIColor.blackColor())
        XCTAssertFalse(UIColor.blackColor() != UIColor.blackColor())
        XCTAssertFalse(UIColor.blackColor() == UIColor.redColor())
        XCTAssertTrue(UIColor.blackColor() != UIColor.redColor())
        
        XCTAssertEqual(UIColor.blackColor(), UIColor.blackColor())
        XCTAssertNotEqual(UIColor.blackColor(), UIColor.redColor())
    }
    
    func test_hex_color_format() {
        XCTAssertTrue(UIColor(hexString: "#000") == UIColor.blackColor())
        XCTAssertTrue(UIColor(hexString: "#000000") == UIColor.blackColor())
        XCTAssertTrue(UIColor(hexString: "0x000") == UIColor.blackColor())
        XCTAssertTrue(UIColor(hexString: "0x000000") == UIColor.blackColor())
        XCTAssertTrue(UIColor(hexString: "0X000000") == UIColor.blackColor())
        XCTAssertTrue(UIColor(hexString: "000") == UIColor.blackColor())
        XCTAssertTrue(UIColor(hexString: "000000") == UIColor.blackColor())

        XCTAssertTrue(UIColor(hexString: "#FFF") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "#FFFFFF") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "0xFFF") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "0xFFFFFF") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "FFF") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "FFFFFF") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "#fff") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "#ffffff") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "0xfff") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "0xffffff") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "0Xffffff") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "fff") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "ffffff") == UIColor.whiteColor())
        XCTAssertTrue(UIColor(hexString: "aaaaaa") == UIColor(red: 170/255.0, green: 170/255.0, blue: 170/255.0, alpha: 1.0))
        
        
        
        XCTAssertFalse(UIColor(hexString: "#0x000") == UIColor.blackColor())
        XCTAssertFalse(UIColor(hexString: "#0x000000") == UIColor.blackColor())
        XCTAssertFalse(UIColor(hexString: "0x#000") == UIColor.blackColor())
        XCTAssertFalse(UIColor(hexString: "0x#000000") == UIColor.blackColor())
        XCTAssertFalse(UIColor(hexString: "#0x0000") == UIColor.blackColor())
        XCTAssertFalse(UIColor(hexString: "0x#00000") == UIColor.blackColor())
        
        XCTAssertFalse(UIColor(hexString: "0") == UIColor.blackColor())
        XCTAssertFalse(UIColor(hexString: "0000") == UIColor.blackColor())
        XCTAssertFalse(UIColor(hexString: "00000000") == UIColor.blackColor())
        
        XCTAssertFalse(UIColor(hexString: "ffff") == UIColor.blackColor())
        XCTAssertFalse(UIColor(hexString: "fffffff") == UIColor.blackColor())
        XCTAssertFalse(UIColor(hexString: "abcdeg") == UIColor.blackColor())
        XCTAssertFalse(UIColor(hexString: "wwwwww") == UIColor.blackColor())
        XCTAssertFalse(UIColor(hexString: "0x0x0x") == UIColor.blackColor())
    }
    
    func test_hex_color_6_digit() {
        XCTAssertTrue(UIColor(hexString: "#000000") == UIColor.blackColor())
        XCTAssertTrue(UIColor(hexString: "000000") == UIColor.blackColor())
        XCTAssertTrue(UIColor(hexString: "#FF0000") == UIColor.redColor())
        XCTAssertTrue(UIColor(hexString: "#00FF00") == UIColor.greenColor())
        XCTAssertTrue(UIColor(hexString: "#0000FF") == UIColor.blueColor())
        XCTAssertFalse(UIColor(hexString: "#000FFF") == UIColor.blueColor())
    }
}
