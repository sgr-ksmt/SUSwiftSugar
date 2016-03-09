//
//  StringExtensionsTests.swift

import XCTest
@testable import SUSwiftSugar

class StringExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_compatible_NSString_functions() {
        let str = "Apple"
        
        XCTAssertEqual(str.length, 5)
        
        XCTAssertEqual(str.substringFromIndex(2), "ple")
        XCTAssertEqual(str.substringToIndex(2), "Ap")
        XCTAssertEqual(str.substringWithRange(NSRange(location: 1, length: 3)), "ppl")
        
        var path = "path/to/hoge.txt"
        XCTAssertEqual(path.lastPathComponent, "hoge.txt")
        XCTAssertEqual(path.pathExtension, "txt")
        XCTAssertEqual(path.stringByDeletingLastPathComponent, "path/to")
        XCTAssertEqual(path.stringByDeletingPathExtension, "path/to/hoge")
        XCTAssertEqual(path.pathComponents, ["path", "to", "hoge.txt"])
        
        path = "path/to"
        XCTAssertEqual(path.stringByAppendingPathComponent("fuga"), "path/to/fuga")
        XCTAssertEqual(
            path.stringByAppendingPathComponent("fuga").stringByAppendingPathExtension("png"),
            "path/to/fuga.png"
        )
    }
    
    func test_subscript() {
        let str = "abcdefghijklmn"
        
        XCTAssertEqual(str[4], "e")
        XCTAssertEqual(str[str.length-1], "n")
        XCTAssertEqual(str[-1], "n")
        XCTAssertEqual(str[-3], "l")
        
        XCTAssertEqual(str[0..<str.length], str)
        XCTAssertEqual(str[4..<6], "ef")
        
    }
    
    func test_blank() {
        let blank1 = "    a     "
        let blank2 = "          "
        let blank3 = "     \n    \n     "
        let blank4 = "     \n    \na     "
        XCTAssertFalse(blank1.isBlank)
        XCTAssertTrue(blank2.isBlank)
        XCTAssertTrue(blank3.isBlank)
        XCTAssertFalse(blank4.isBlank)
    }
    
    func test_contains() {
        let str = "MacBook Air"
        
        XCTAssertFalse(str.contains("macbook"))
        XCTAssertTrue(str.contains("MacBook"))
        XCTAssertTrue(str.contains("macbook", compareOption: [.CaseInsensitiveSearch]))
    }
    
    func test_replace() {
        var str = "Apple, Banana, Orange"
        XCTAssertEqual(str.replacedString("Orange", withString: "Candy"), "Apple, Banana, Candy")
        XCTAssertNotEqual(str.replacedString("orange", withString: "Candy"), "Apple, Banana, Candy")
        
        str.replace("banana", withString: "Pine")
        XCTAssertNotEqual(str, "Apple, Pine, Orange")
        str.replace("Banana", withString: "Pine")
        XCTAssertEqual(str, "Apple, Pine, Orange")
    }
    
    func test_repeat_operator() {
        let str = "a"
        XCTAssertEqual(str * 1, str)
        XCTAssertEqual(str * 0, "")
        XCTAssertEqual(str * (-100), "")
        XCTAssertEqual(str * 10, "aaaaaaaaaa")
        XCTAssertEqual(str + "b" * 5, "abbbbb")
        XCTAssertEqual(str * 5 + "b", "aaaaab")
        XCTAssertEqual((str + "b") * 5, "ababababab")
    }
    
    func test_replace_operator() {
        let str = "Apple, Banana, Orange"
        var result1 = str <> ("apple", "Pine")
        XCTAssertNotEqual(result1, "Pine, Banana, Orange")
        result1 = str <> ("Apple", "Pine")
        XCTAssertEqual(result1, "Pine, Banana, Orange")
        
        let result2 = "Hoge, " + str <> ("Hoge", "Fuga") + ", Hoge"
        XCTAssertEqual(result2, "Hoge, Apple, Banana, Orange, Hoge")
        
        let result3 = ("Hoge, " + str) <> ("Hoge", "Fuga") + ", Hoge"
        XCTAssertEqual(result3, "Fuga, Apple, Banana, Orange, Hoge")

        let str2 = "Apple"
        let result4 = str2 * 3 <> ("le", "") + "Hoge"
        XCTAssertEqual(result4, "AppAppAppHoge")
        
        
        let result5 = "Hoge, " * 2 + str <> ("oge", "") + ", Hoge"
        XCTAssertEqual(result5, "Hoge, Hoge, Apple, Banana, Orange, Hoge")

        let result6 = ("Hoge, " * 2 + str) <> ("oge", "") + ", Hoge"
        XCTAssertEqual(result6, "H, H, Apple, Banana, Orange, Hoge")

        var str3 = "Apple"
        str3 <-> ("le","")
        XCTAssertEqual(str3, "App")
        
    }
}
