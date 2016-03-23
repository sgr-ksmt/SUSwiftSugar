//
//  TypeNameTests.swift

import XCTest
import SUSwiftSugar

class TestClass_Some: NSObject {}
class TestClass_Fuga { class TestClass_Piyo { } }

class TypeNameTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_typeName() {
        XCTAssertEqual(TypeName(TestClass_Some.self), "TestClass_Some")
        let some = TestClass_Some()
        XCTAssertEqual(TypeName(some.dynamicType), "TestClass_Some")
        XCTAssertEqual(TypeName(TestClass_Fuga.self), "TestClass_Fuga")
        XCTAssertEqual(TypeName(TestClass_Fuga.TestClass_Piyo.self), "TestClass_Piyo")
        XCTAssertEqual(TypeName(TestClass_Fuga.TestClass_Piyo().dynamicType), "TestClass_Piyo")
        
    }
    
    func test_fullTypeName() {
        func fullClassName(className: String) -> String {
            let moduleName = "SUSwiftSugarTests"
            return moduleName + "." + className
        }
        
        XCTAssertEqual(FullTypeName(TestClass_Some.self), fullClassName("TestClass_Some"))
        XCTAssertEqual(FullTypeName(TestClass_Some().dynamicType), fullClassName("TestClass_Some"))
        XCTAssertEqual(FullTypeName(TestClass_Fuga.self), fullClassName("TestClass_Fuga"))
        XCTAssertEqual(FullTypeName(TestClass_Fuga.TestClass_Piyo.self), fullClassName("TestClass_Fuga.TestClass_Piyo"))
        XCTAssertEqual(FullTypeName(TestClass_Fuga.TestClass_Piyo().dynamicType), fullClassName("TestClass_Fuga.TestClass_Piyo"))
    }
}
