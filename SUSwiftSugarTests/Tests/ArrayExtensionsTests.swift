//
//  ArrayExtensionTests.swift

import XCTest
@testable import SUSwiftSugar

class ArrayExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_stack() {
        var array = [1, 2, 3, 4]
        array.push(0)
        XCTAssert(array.count == 5 && array.last == 0, "wrong count : \(array.count)")
        array = [1, 2, 3]
        array.pop()
        XCTAssert(array.count == 2 && array.last == 2, "wrong count : \(array.count)")
        array.pop()
        array.pop()
        XCTAssert(array.count == 0 && array.last == nil, "wrong count : \(array.count)")
        array.pop()
        XCTAssert(array.count == 0 && array.last == nil, "wrong count : \(array.count)")
    }
    
    func test_queue() {
        var array = [1]
        array.enqueue(2)
        XCTAssertEqual(array, [1,2])
        array.dequeue()
        XCTAssertEqual(array, [2])
        let dequeued = array.dequeue()
        XCTAssertTrue(dequeued != nil)
        XCTAssertEqual(array, [])
        XCTAssertTrue(array.dequeue() == nil)
    }
    
    func test_each() {
        let array = [1, 2, 3, 4]
        var resultWithLoop = [Int]()
        var resultWithBlock = [Int]()
        
        for x in array { resultWithLoop.append(x) }
        array.each { resultWithBlock.append($0) }
        
        XCTAssertEqual(resultWithLoop, resultWithBlock)
        
        resultWithLoop = []
        resultWithBlock = []

        for (index, x) in array.enumerate() {
            resultWithLoop.append(x * (index + 1))
        }
        
        array.eachWithIndex { resultWithBlock.append($0.0) }
        XCTAssertNotEqual(resultWithLoop, resultWithBlock)
        
        resultWithBlock = []

        array.eachWithIndex { resultWithBlock.append($0.0 * ($0.1 + 1)) }
        XCTAssertEqual(resultWithLoop, resultWithBlock)
    }
    
    func test_any_all() {
        var array = [1, 3, 4, 5, 7, 9]
        XCTAssertTrue(array.any({ $0 % 2 == 0 }))
        XCTAssertFalse(array.all({ $0 % 2 == 1 }))
        
        array = [1, 3, 5, 7, 9]
        XCTAssertFalse(array.any({ $0 % 2 == 0 }))
        XCTAssertTrue(array.all({ $0 % 2 == 1 }))
        XCTAssertTrue(array.none{$0 % 2 == 0})
        XCTAssertTrue(array.one({ $0 == 1 }))
    }
    
    func test_unique() {
        var array = [Int]()
        let result = [1, 2, 3]
        func reset(inout array: [Int]) {
            array = [1, 1, 1, 2, 2, 3]
        }
        reset(&array)
        
        let unique = array.unique()
        XCTAssertEqual(unique, result)
        
        reset(&array)

        array.uniqueInPlace()
        XCTAssertEqual(array, result)
        
        reset(&array)
        
        let unique2 = Array.unique(array)
        XCTAssertEqual(unique2, result)
    }
    
    func test_removeObject() {
        var array = [1,2,3]
        array.removeElement(1)
        XCTAssertTrue(array.count == 2)
        XCTAssertFalse(array.contains(1))
        array = []
        let removed = array.removeElement(1)
        XCTAssertTrue(removed == nil)
    }
    
    func test_random() {
        let hoge = [Int](0..<10000)
        let r1 = hoge.random()
        let r2 = hoge.random()
        XCTAssertNotEqual(r1, r2)
    }
    
    func test_shuffhe() {
        var array = [Int](0..<10)
        XCTAssertNotEqual(array, array.shuffledArray())
        
        let tmp = array
        array.shuffle()
        XCTAssertNotEqual(array, tmp)
    }
    
    func testSum() {
        let array = [Int](1...10)
        XCTAssertEqual(array.sum(), 55)
        let other = array[0..<5]
        XCTAssertEqual(other.sum(), 15)
        XCTAssertEqual((array+other).sum(), 70)
    }
}
