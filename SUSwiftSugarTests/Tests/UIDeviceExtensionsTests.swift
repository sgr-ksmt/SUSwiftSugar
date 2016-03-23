//
//  UIDeviceExtensionsTests.swift

import XCTest
import SUSwiftSugar

class UIDeviceExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPlatform() {
        func isCorrectPlatform(target target: DeviceType, identifiers: [String]) {
            identifiers.forEach {
                XCTAssertEqual(DeviceModel(identifier: $0).type, target)
            }
        }
        isCorrectPlatform(target: .iPodTouch5, identifiers: ["iPod5,1"])
        isCorrectPlatform(target: .iPodTouch6, identifiers: ["iPod7,1"])

        isCorrectPlatform(target: .iPhone4, identifiers: ["iPhone3,1", "iPhone3,2", "iPhone3,3"])
        isCorrectPlatform(target: .iPhone4s, identifiers: ["iPhone4,1"])

        isCorrectPlatform(target: .iPhone5, identifiers: ["iPhone5,1", "iPhone5,2"])
        isCorrectPlatform(target: .iPhone5s, identifiers: ["iPhone6,1", "iPhone6,2"])
        isCorrectPlatform(target: .iPhone5c, identifiers: ["iPhone5,3", "iPhone5,4"])

        isCorrectPlatform(target: .iPhone6, identifiers: ["iPhone7,2"])
        isCorrectPlatform(target: .iPhone6Plus, identifiers: ["iPhone7,1"])

        isCorrectPlatform(target: .iPhone6s, identifiers: ["iPhone8,1"])
        isCorrectPlatform(target: .iPhone6sPlus, identifiers: ["iPhone8,2"])

        isCorrectPlatform(target: .iPad2, identifiers: ["iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4"])
        isCorrectPlatform(target: .iPad3, identifiers: ["iPad3,1", "iPad3,2", "iPad3,3"])
        isCorrectPlatform(target: .iPad4, identifiers: ["iPad3,4", "iPad3,5", "iPad3,6"])

        isCorrectPlatform(target: .iPadAir, identifiers: ["iPad4,1", "iPad4,2", "iPad4,3"])
        isCorrectPlatform(target: .iPadAir2, identifiers: ["iPad5,3", "iPad5,4"])

        isCorrectPlatform(target: .iPadMini, identifiers: ["iPad2,5", "iPad2,6", "iPad2,7"])
        isCorrectPlatform(target: .iPadMini2, identifiers: ["iPad4,4", "iPad4,5", "iPad4,6"])
        isCorrectPlatform(target: .iPadMini3, identifiers: ["iPad4,7", "iPad4,8", "iPad4,9"])
        isCorrectPlatform(target: .iPadMini4, identifiers: ["iPad5,1", "iPad5,2"])

        isCorrectPlatform(target: .iPadPro, identifiers: ["iPad6,7", "iPad6,8"])

        isCorrectPlatform(target: .Simulator, identifiers: ["i386", "x86_64"])
        isCorrectPlatform(target: .Unknown, identifiers: ["iPhoneX,Y"])
        
    }
}
