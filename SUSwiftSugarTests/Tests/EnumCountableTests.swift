//
//  EnumCountableTests.swift
//  SUSwiftSugar
//
//  Created by Suguru Kishimoto on 2015/12/02.
//  Copyright © 2015年 SFIDANTE Inc. All rights reserved.
//

import XCTest
@testable import SUSwiftSugar


enum Hoge: Int, EnumEnumerable {
    case A, B, C, D
}

enum Fuga: String, EnumEnumerable {
    case A, B, C, D, E
}

enum Piyo: EnumEnumerable {
    case A, B, C, D, E, F
}

class EnumCountableTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_countable_enum() {
        Piyo.A.hashValue
        print(Hoge.cases)
        print(Hoge.cases[0] == Hoge.A)
        Piyo.enumerate().forEach { print($0.0,$0.1) }
        XCTAssertEqual(Hoge.count, 4)
        XCTAssertEqual(Hoge.cases.count, 4)
        XCTAssertEqual(Fuga.count, 5)
        XCTAssertEqual(Fuga.cases.count, 5)
        XCTAssertEqual(Piyo.count, 6)
        XCTAssertEqual(Piyo.cases.count, 6)
    }
}
