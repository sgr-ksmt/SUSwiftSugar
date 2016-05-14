//
//  URLConvertible.swift
//  SUSwiftSugar
//
//  Created by Suguru Kishimoto on 2016/05/15.
//
//

import Foundation

protocol URLConvertible {
    var url: NSURL { get }
}

extension String: URLConvertible {
    var url: NSURL {
        return NSURL(string: self)!
    }
}

extension NSURL: URLConvertible {
    var url: NSURL {
        return self
    }
}
