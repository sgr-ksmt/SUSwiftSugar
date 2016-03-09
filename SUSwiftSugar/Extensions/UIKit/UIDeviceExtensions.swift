//
//  UIDeviceExtensions.swift

import Foundation
import UIKit

// MARK: - Detect device model name

public enum DeviceType {
    case iPodTouch5
    case iPodTouch6
    case iPhone4
    case iPhone4s
    case iPhone5
    case iPhone5s
    case iPhone5c
    case iPhone6
    case iPhone6Plus
    case iPhone6s
    case iPhone6sPlus
    case iPad2
    case iPad3
    case iPad4
    case iPadAir
    case iPadAir2
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadPro
    case Simulator
    case Unknown
}

private class DeviceIdentifiers {
    private init() {} // only use constants
    static let iPodTouch5   = ["iPod5,1"]
    static let iPodTouch6   = ["iPod7,1"]
    static let iPhone4      = ["iPhone3,1", "iPhone3,2", "iPhone3,3"]
    static let iPhone4s     = ["iPhone4,1"]
    static let iPhone5      = ["iPhone5,1", "iPhone5,2"]
    static let iPhone5s     = ["iPhone6,1", "iPhone6,2"]
    static let iPhone5c     = ["iPhone5,3", "iPhone5,4"]
    static let iPhone6      = ["iPhone7,2"]
    static let iPhone6Plus  = ["iPhone7,1"]
    static let iPhone6s     = ["iPhone8,1"]
    static let iPhone6sPlus = ["iPhone8,2"]
    static let iPad2        = ["iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4"]
    static let iPad3        = ["iPad3,1", "iPad3,2", "iPad3,3"]
    static let iPad4        = ["iPad3,4", "iPad3,5", "iPad3,6"]
    static let iPadAir      = ["iPad4,1", "iPad4,2", "iPad4,3"]
    static let iPadAir2     = ["iPad5,3", "iPad5,4"]
    static let iPadmini     = ["iPad2,5", "iPad2,6", "iPad2,7"]
    static let iPadmini2    = ["iPad4,4", "iPad4,5", "iPad4,6"]
    static let iPadmini3    = ["iPad4,7", "iPad4,8", "iPad4,9"]
    static let iPadmini4    = ["iPad5,1", "iPad5,2"]
    static let iPadPro      = ["iPad6,7", "iPad6,8"]
    static let Simulator    = ["i386", "x86_64"]
    static let Unknown      = ["iPhoneX,Y"] // for test
}

public struct DeviceModel {

    private(set) public var type: DeviceType = .Unknown
    private(set) public var identifier: String = ""
    private(set) public var name: String = ""
    
    public init(identifier: String) {
        self.identifier = identifier
        self.type = specifierType(identifier)
        self.name = specifierName(identifier, type:self.type)
    }
    
    private func specifierType(identifier: String) -> DeviceType {
        switch identifier {
        case let i where DeviceIdentifiers.iPodTouch5.contains(i):   return .iPodTouch5
        case let i where DeviceIdentifiers.iPodTouch6.contains(i):   return .iPodTouch6
        case let i where DeviceIdentifiers.iPhone4.contains(i):      return .iPhone4
        case let i where DeviceIdentifiers.iPhone4s.contains(i):     return .iPhone4s
        case let i where DeviceIdentifiers.iPhone5.contains(i):      return .iPhone5
        case let i where DeviceIdentifiers.iPhone5s.contains(i):     return .iPhone5s
        case let i where DeviceIdentifiers.iPhone5c.contains(i):     return .iPhone5c
        case let i where DeviceIdentifiers.iPhone6.contains(i):      return .iPhone6
        case let i where DeviceIdentifiers.iPhone6Plus.contains(i):  return .iPhone6Plus
        case let i where DeviceIdentifiers.iPhone6s.contains(i):     return .iPhone6s
        case let i where DeviceIdentifiers.iPhone6sPlus.contains(i): return .iPhone6sPlus
        case let i where DeviceIdentifiers.iPad2.contains(i):        return .iPad2
        case let i where DeviceIdentifiers.iPad3.contains(i):        return .iPad3
        case let i where DeviceIdentifiers.iPad4.contains(i):        return .iPad4
        case let i where DeviceIdentifiers.iPadAir.contains(i):      return .iPadAir
        case let i where DeviceIdentifiers.iPadAir2.contains(i):     return .iPadAir2
        case let i where DeviceIdentifiers.iPadmini.contains(i):     return .iPadMini
        case let i where DeviceIdentifiers.iPadmini2.contains(i):    return .iPadMini2
        case let i where DeviceIdentifiers.iPadmini3.contains(i):    return .iPadMini3
        case let i where DeviceIdentifiers.iPadmini4.contains(i):    return .iPadMini4
        case let i where DeviceIdentifiers.iPadPro.contains(i):      return .iPadPro
        case let i where DeviceIdentifiers.Simulator.contains(i):    return .Simulator
        default: return .Unknown
        }
    }
    
    private func specifierName(identifier: String, type: DeviceType) -> String {
        switch type {
        case .iPodTouch5:   return "iPod Touch 5"
        case .iPodTouch6:   return "iPod Touch 6"
        case .iPhone4:      return "iPhone 4"
        case .iPhone4s:     return "iPhone 4s"
        case .iPhone5:      return "iPhone 5"
        case .iPhone5s:     return "iPhone 5s"
        case .iPhone5c:     return "iPhone 5c"
        case .iPhone6:      return "iPhone 6"
        case .iPhone6Plus:  return "iPhone 6 Plus"
        case .iPhone6s:     return "iPhone 6s"
        case .iPhone6sPlus: return "iPhone 6s Plus"
        case .iPad2:        return "iPad 2"
        case .iPad3:        return "iPad 3"
        case .iPad4:        return "iPad 4"
        case .iPadAir:      return "iPad Air"
        case .iPadAir2:     return "Pad Air 2"
        case .iPadMini:     return "iPad mini"
        case .iPadMini2:    return "iPad mini 2"
        case .iPadMini3:    return "iPad mini 3"
        case .iPadMini4:    return "iPad mini 4"
        case .iPadPro:      return "iPad Pro"
        case .Simulator:    return "Simulator"
        case .Unknown:      return identifier
        }
    }
    
}

extension UIDevice {
    
    func deviceModel() -> DeviceModel {
        /**
         * get identifier
         * inspired by :
         * https://github.com/dennisweissmann/DeviceKit/blob/master/SharedCode/Device.swift
        */
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror(reflecting: systemInfo.machine)
        let identifier = mirror.children.reduce("") { (identifier, element) -> String in
            guard let value = element.value as? Int8 where value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return DeviceModel(identifier: identifier)
    }
    
}