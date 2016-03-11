//
//  NSFileManagerTests.swift
//  SUSwiftSugar
//
//  Created by Suguru Kishimoto on 2016/03/09.
//
//

import XCTest

class NSFileManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    private func createTestData() -> NSData {
        return "test".dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    func test_filePathConvertible() {
        let path = "/file/to/path.ext"
        let url = NSURL(fileURLWithPath: "/file/to/path.ext")
        XCTAssertEqual(path, url.filePath)
        XCTAssertEqual(path.fileURL, url)
    }
    
    func test_testSafeRemove() {
    }
    
    func test_forceMove() {
        
    }
    
    func test_forceCopy() {
        
    }
    
}
