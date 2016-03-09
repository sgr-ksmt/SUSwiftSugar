//
//  CGGeometryExtensionsTests.swift
//  SUSwiftSugar
//
//  Created by Suguru Kishimoto on 2015/11/26.
//  Copyright © 2015年 SFIDANTE Inc. All rights reserved.
//

import XCTest
@testable import SUSwiftSugar

class CGGeometryExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_cgpoint_operator() {
        func reset(inout p: CGPoint) {
            p = CGPoint(100, 100)
        }
        var p = CGPointZero
        
        // addition
        reset(&p)
        XCTAssertEqual(p + CGPoint(50, 50), CGPoint(150, 150))
        p += CGPoint(50, -50)
        XCTAssertEqual(p, CGPoint(150, 50))
        
        // subtraction
        reset(&p)
        XCTAssertEqual(p - CGPoint(50, 50), CGPoint(50, 50))
        p -= CGPoint(50, -50)
        XCTAssertEqual(p, CGPoint(50, 150))

        // multiplication
        reset(&p)
        XCTAssertEqual(p * CGPoint(2, 3), CGPoint(200, 300))
        XCTAssertEqual(p * 2, CGPoint(200, 200))
        XCTAssertEqual(p * CGPoint(1, 1.5) * 2, CGPoint(200, 300))
        XCTAssertEqual(p * (CGPoint(2, 3) * 0.5), CGPoint(100, 150))
        XCTAssertEqual(p * CGPoint(1, 1.5) * (2 * 3), CGPoint(600, 900))
        p *= CGPoint(1.5, 0.5)
        XCTAssertEqual(p, CGPoint(150, 50))
        reset(&p)
        p *= (CGPoint(1.5, 0.5) * 2)
        XCTAssertEqual(p, CGPoint(300, 100))
        reset(&p)
        p *= 4
        XCTAssertEqual(p, CGPoint(400, 400))
        
        // division
        reset(&p)
        XCTAssertEqual(p / CGPoint(2, 4), CGPoint(50, 25))
        XCTAssertEqual(p / 10, CGPoint(10, 10))
        XCTAssertEqual(p / CGPoint(2, 4) / 2, CGPoint(25, 12.5))
        XCTAssertEqual(p / (CGPoint(2, 4) / 2), CGPoint(100, 50))
        p /= CGPoint(2, 4)
        XCTAssertEqual(p, CGPoint(50, 25))
        reset(&p)
        p /= (CGPoint(2, 4) / 2)
        XCTAssertEqual(p, CGPoint(100, 50))
        reset(&p)
        p /= 4
        XCTAssertEqual(p, CGPoint(25, 25))

        reset(&p)
        p += (CGPoint(20, 20) + CGPoint(40, -40) / 4 - CGPoint(10, -40) / (2 * 5))
        XCTAssertEqual(p, CGPoint(129,114))
    }
    
    func test_cgsize_operators() {
        func reset(inout s: CGSize) {
            s = CGSize(100, 100)
        }
        var s = CGSizeZero
        
        // addition
        reset(&s)
        XCTAssertEqual(s + CGSize(50, 50), CGSize(150, 150))
        s += CGSize(50, -50)
        XCTAssertEqual(s, CGSize(150, 50))
        
        // subtraction
        reset(&s)
        XCTAssertEqual(s - CGSize(50, 50), CGSize(50, 50))
        s -= CGSize(50, -50)
        XCTAssertEqual(s, CGSize(50, 150))
        
        // multiplication
        reset(&s)
        XCTAssertEqual(s * 2, CGSize(200, 200))
        XCTAssertEqual(s * CGSize(1, 1.5) * 2, CGSize(200, 300))
        XCTAssertEqual(s * (CGSize(2, 3) * 0.5), CGSize(100, 150))
        XCTAssertEqual(s * CGSize(1, 1.5) * (2 * 3), CGSize(600, 900))
        s *= CGSize(1.5, 0.5)
        XCTAssertEqual(s, CGSize(150, 50))
        reset(&s)
        s *= (CGSize(1.5, 0.5) * 2)
        XCTAssertEqual(s, CGSize(300, 100))
        reset(&s)
        s *= 4
        XCTAssertEqual(s, CGSize(400, 400))
        
        // division
        reset(&s)
        XCTAssertEqual(s / CGSize(2, 4), CGSize(50, 25))
        XCTAssertEqual(s / 10, CGSize(10, 10))
        XCTAssertEqual(s / CGSize(2, 4) / 2, CGSize(25, 12.5))
        XCTAssertEqual(s / (CGSize(2, 4) / 2), CGSize(100, 50))
        s /= CGSize(2, 4)
        XCTAssertEqual(s, CGSize(50, 25))
        reset(&s)
        s /= (CGSize(2, 4) / 2)
        XCTAssertEqual(s, CGSize(100, 50))
        reset(&s)
        s /= 4
        XCTAssertEqual(s, CGSize(25, 25))
        
        reset(&s)
        s += (CGSize(20, 20) + CGSize(40, -40) / 4 - CGSize(10, -40) / (2 * 5))
        XCTAssertEqual(s, CGSize(129,114))
    }
    
    func test_cgrect_operators() {
        func reset(inout r: CGRect) {
            r = CGRect(CGPoint(10, 10), CGSize(150, 100))
        }
        var r = CGRectZero
        
        reset(&r)
        XCTAssertEqual(r + CGRect(CGPoint(10, -10), CGSize(-50, 50)), CGRect(CGPoint(20, 0), CGSize(100, 150)))
        r += CGRect(CGPoint(10, -10), CGSize(-50, 50))
        XCTAssertEqual(r, CGRect(CGPoint(20, 0), CGSize(100, 150)))
        
        reset(&r)
        XCTAssertEqual(r - CGRect(CGPoint(20, 30), CGSize(50, -150)), CGRect(CGPoint(-10, -20), CGSize(100, 250)))
        
        r -= CGRect(CGPoint(20, 30), CGSize(50, -150))
        XCTAssertEqual(r, CGRect(CGPoint(-10, -20), CGSize(100, 250)))
    }
    
    func test_cgrect_functions() {
        XCTAssertEqual(CGRectUnion(CGRectNull, CGRect(10, 10, 150, 150)), CGRect(10, 10, 150, 150))
        
        let rects = [CGRect(10, 10, 20, 20), CGRect(30, -10, 60, 80), CGRect(60, 40, 30, 30)]
        
        XCTAssertEqual(CGRectUnion(rects), CGRectUnion(CGRectUnion(rects[0], rects[1]), rects[2]))
        XCTAssertEqual(CGRectUnion(rects), CGRectUnion(CGRectUnion(rects[1], rects[2]), rects[0]))
        XCTAssertEqual(CGRectUnion(rects), CGRectUnion(CGRectUnion(rects[2], rects[0]), rects[1]))
    }
    
}
