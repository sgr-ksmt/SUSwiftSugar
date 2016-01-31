//
//  EnumCountableTests.swift
//  SUSwiftSugar
//
//  Created by Suguru Kishimoto on 2015/12/02.
//  Copyright © 2015年 SFIDANTE Inc. All rights reserved.
//

import XCTest
@testable import SUSwiftSugar


class EnumCountableTests: XCTestCase {

    enum Hoge: Int, EnumCountable {
        case A, B, C, D
    }
    
    enum Fuga: String, EnumCountable {
        case A, B, C, D, E
    }


    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_countable_enum() {
        XCTAssertEqual(Hoge.count, 4)
        XCTAssertEqual(Hoge.elements().count, 4)
        XCTAssertEqual(Fuga.count, 5)
        XCTAssertEqual(Fuga.elements().count, 5)
    }
}
