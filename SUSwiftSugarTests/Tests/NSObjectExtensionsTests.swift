//
//  NSObjectExtensionsTests.swift

import XCTest
@testable import SUSwiftSugar

class TestClass_Hoge: NSObject {
}

class NSObjectExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_className() {
        XCTAssertEqual(TestClass_Hoge.className, "TestClass_Hoge")
        XCTAssertEqual(TestClass_Hoge().className, "TestClass_Hoge")
    }
}
