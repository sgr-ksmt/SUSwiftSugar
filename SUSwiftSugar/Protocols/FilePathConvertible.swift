//
//  FilePathConvertible.swift
//  SUSwiftSugar
//
//  Created by Suguru Kishimoto on 2016/03/09.
//
//

import Foundation

public protocol FilePathConvertible {
    var filePath: String { get }
    var fileURL: NSURL { get }
}

extension String: FilePathConvertible {
    public var filePath: String {
        return self
    }
    public var fileURL: NSURL {
        return NSURL(fileURLWithPath: self)
    }
}

extension NSURL: FilePathConvertible {
    public var filePath: String {
        return self.path!
    }
    public var fileURL: NSURL {
        return self
    }
}
