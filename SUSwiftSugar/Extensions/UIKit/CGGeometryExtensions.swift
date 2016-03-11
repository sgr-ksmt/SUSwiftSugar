//
//  CGGeometryExtensions.swift
//  SFISwiftExtensions

import Foundation
import UIKit

public protocol CGFloatType {
    var f: CGFloat { get }
}

extension Int: CGFloatType {
    public var f: CGFloat {
        return CGFloat(self)
    }
}

extension Float: CGFloatType {
    public var f: CGFloat {
        return CGFloat(self)
    }
}

extension Double: CGFloatType {
    public var f: CGFloat {
        return CGFloat(self)
    }
}

extension CGFloat: CGFloatType {
    public var f: CGFloat {
        return self
    }
}


public extension CGPoint {
    public init(_ x: CGFloatType, _ y: CGFloatType) {
        self.init(x: x.f, y: y.f)
    }
}

public func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(lhs.x + rhs.x, lhs.y + rhs.y)
}

public func += (inout lhs: CGPoint, rhs: CGPoint) {
    lhs = lhs + rhs
}

public func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(lhs.x - rhs.x, lhs.y - rhs.y)
}

public func -= (inout lhs: CGPoint, rhs: CGPoint) {
    lhs = lhs - rhs
}

public func * (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(lhs.x * rhs.x, lhs.y * rhs.y)
}

public func *= (inout lhs: CGPoint, rhs: CGPoint) {
    lhs = lhs * rhs
}

public func * (point: CGPoint, scalar: CGFloatType) -> CGPoint {
    return CGPoint(point.x * scalar.f, point.y * scalar.f)
}

public func *= (inout point: CGPoint, scalar: CGFloatType) {
    point = point * scalar
}

public func / (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(lhs.x / rhs.x, lhs.y / rhs.y)
}

public func /= (inout lhs: CGPoint, rhs: CGPoint) {
    lhs = lhs / rhs
}

public func / (point: CGPoint, scalar: CGFloatType) -> CGPoint {
    return CGPoint(point.x / scalar.f, point.y / scalar.f)
}

public func /= (inout point: CGPoint, scalar: CGFloatType) {
    point = point / scalar
}



public extension CGSize {
    public init(_ width: CGFloatType, _ height: CGFloatType) {
       self.init(width: width.f, height: height.f)
    }
}

public func + (lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(lhs.width + rhs.width, lhs.height + rhs.height)
}

public func += (inout lhs: CGSize, rhs: CGSize) {
    lhs = lhs + rhs
}

public func - (lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(lhs.width - rhs.width, lhs.height - rhs.height)
}

public func -= (inout lhs: CGSize, rhs: CGSize) {
    lhs = lhs - rhs
}

public func * (lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(lhs.width * rhs.width, lhs.height * rhs.height)
}

public func *= (inout lhs: CGSize, rhs: CGSize) {
    lhs = lhs * rhs
}

public func * (size: CGSize, scalar: CGFloatType) -> CGSize {
    return CGSize(size.width * scalar.f, size.height * scalar.f)
}

public func *= (inout size: CGSize, scalar: CGFloatType) {
    size = size * scalar
}

public func / (lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(lhs.width / rhs.width, lhs.height / rhs.height)
}

public func /= (inout lhs: CGSize, rhs: CGSize) {
    lhs = lhs / rhs
}

public func / (size: CGSize, scalar: CGFloatType) -> CGSize {
    return CGSize(size.width / scalar.f, size.height / scalar.f)
}

public func /= (inout size: CGSize, scalar: CGFloatType) {
    size = size / scalar
}


public extension CGRect {
    public init(_ origin: CGPoint, _ size: CGSize) {
        self.init(origin: origin, size: size)
    }
    public init(_ x: CGFloatType, _ y: CGFloatType, _ width: CGFloatType, _ height: CGFloatType) {
        self.init(x: x.f, y: y.f, width: width.f, height: height.f)
    }
}

public func + (lhs: CGRect, rhs: CGRect) -> CGRect {
    return CGRect(lhs.origin + rhs.origin, lhs.size + rhs.size)
}

public func += (inout lhs: CGRect, rhs: CGRect) {
    lhs = lhs + rhs
}

public func - (lhs: CGRect, rhs: CGRect) -> CGRect {
    return CGRect(lhs.origin - rhs.origin, lhs.size - rhs.size)
}

public func -= (inout lhs: CGRect, rhs: CGRect) {
    lhs = lhs - rhs
}

public func CGRectUnion(rects: [CGRect]) -> CGRect {
    return rects.reduce(.null) { CGRectUnion($0, $1) }
}