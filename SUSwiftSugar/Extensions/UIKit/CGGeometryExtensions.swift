//
//  CGGeometryExtensions.swift
//  SFISwiftExtensions

import Foundation
import UIKit

protocol CGFloatType {
    var f: CGFloat { get }
}

extension Int: CGFloatType {
    var f: CGFloat {
        return CGFloat(self)
    }
}

extension Float: CGFloatType {
    var f: CGFloat {
        return CGFloat(self)
    }
}

extension Double: CGFloatType {
    var f: CGFloat {
        return CGFloat(self)
    }
}

extension CGFloat: CGFloatType {
    var f: CGFloat {
        return self
    }
}


extension CGPoint {
    init(_ x: CGFloatType, _ y: CGFloatType) {
        self.init(x: x.f, y: y.f)
    }
}

func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(lhs.x + rhs.x, lhs.y + rhs.y)
}

func += (inout lhs: CGPoint, rhs: CGPoint) {
    lhs = lhs + rhs
}

func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(lhs.x - rhs.x, lhs.y - rhs.y)
}

func -= (inout lhs: CGPoint, rhs: CGPoint) {
    lhs = lhs - rhs
}

func * (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(lhs.x * rhs.x, lhs.y * rhs.y)
}

func *= (inout lhs: CGPoint, rhs: CGPoint) {
    lhs = lhs * rhs
}

func * (point: CGPoint, scalar: CGFloatType) -> CGPoint {
    return CGPoint(point.x * scalar.f, point.y * scalar.f)
}

func *= (inout point: CGPoint, scalar: CGFloatType) {
    point = point * scalar
}

func / (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(lhs.x / rhs.x, lhs.y / rhs.y)
}

func /= (inout lhs: CGPoint, rhs: CGPoint) {
    lhs = lhs / rhs
}

func / (point: CGPoint, scalar: CGFloatType) -> CGPoint {
    return CGPoint(point.x / scalar.f, point.y / scalar.f)
}

func /= (inout point: CGPoint, scalar: CGFloatType) {
    point = point / scalar
}



extension CGSize {
    init(_ width: CGFloatType, _ height: CGFloatType) {
       self.init(width: width.f, height: height.f)
    }
}

func + (lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(lhs.width + rhs.width, lhs.height + rhs.height)
}

func += (inout lhs: CGSize, rhs: CGSize) {
    lhs = lhs + rhs
}

func - (lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(lhs.width - rhs.width, lhs.height - rhs.height)
}

func -= (inout lhs: CGSize, rhs: CGSize) {
    lhs = lhs - rhs
}

func * (lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(lhs.width * rhs.width, lhs.height * rhs.height)
}

func *= (inout lhs: CGSize, rhs: CGSize) {
    lhs = lhs * rhs
}

func * (size: CGSize, scalar: CGFloatType) -> CGSize {
    return CGSize(size.width * scalar.f, size.height * scalar.f)
}

func *= (inout size: CGSize, scalar: CGFloatType) {
    size = size * scalar
}

func / (lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(lhs.width / rhs.width, lhs.height / rhs.height)
}

func /= (inout lhs: CGSize, rhs: CGSize) {
    lhs = lhs / rhs
}

func / (size: CGSize, scalar: CGFloatType) -> CGSize {
    return CGSize(size.width / scalar.f, size.height / scalar.f)
}

func /= (inout size: CGSize, scalar: CGFloatType) {
    size = size / scalar
}


extension CGRect {
    init(_ origin: CGPoint, _ size: CGSize) {
        self.init(origin: origin, size: size)
    }
    init(_ x: CGFloatType, _ y: CGFloatType, _ width: CGFloatType, _ height: CGFloatType) {
        self.init(x: x.f, y: y.f, width: width.f, height: height.f)
    }
}

func + (lhs: CGRect, rhs: CGRect) -> CGRect {
    return CGRect(lhs.origin + rhs.origin, lhs.size + rhs.size)
}

func += (inout lhs: CGRect, rhs: CGRect) {
    lhs = lhs + rhs
}

func - (lhs: CGRect, rhs: CGRect) -> CGRect {
    return CGRect(lhs.origin - rhs.origin, lhs.size - rhs.size)
}

func -= (inout lhs: CGRect, rhs: CGRect) {
    lhs = lhs - rhs
}

func CGRectUnion(rects: [CGRect]) -> CGRect {
    return rects.reduce(.null) { CGRectUnion($0, $1) }
}