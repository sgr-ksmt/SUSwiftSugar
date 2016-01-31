//
//  CGGeometryExtensions.swift
//  SFISwiftExtensions

import Foundation
import UIKit


extension CGPoint {
    
    init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }
    
    init(_ x: Int, _ y: Int) {
        self.init(x: x, y: y)
    }
    
    init(_ x: Double, _ y: Double) {
        self.init(x: x, y: y)
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

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(point.x * scalar, point.y * scalar)
}

func *= (inout point: CGPoint, scalar: CGFloat) {
    point = point * scalar
}

func * (point: CGPoint, scalar: Double) -> CGPoint {
    return point * CGFloat(scalar)
}

func *= (inout point: CGPoint, scalar: Double) {
    point = point * scalar
}

func * (point: CGPoint, scalar: Int) -> CGPoint {
    return point * CGFloat(scalar)
}

func *= (inout point: CGPoint, scalar: Int) {
    point = point * scalar
}

func / (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(lhs.x / rhs.x, lhs.y / rhs.y)
}

func /= (inout lhs: CGPoint, rhs: CGPoint) {
    lhs = lhs / rhs
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(point.x / scalar, point.y / scalar)
}

func /= (inout point: CGPoint, scalar: CGFloat) {
    point = point / scalar
}

func / (point: CGPoint, scalar: Double) -> CGPoint {
    return point / CGFloat(scalar)
}

func /= (inout point: CGPoint, scalar: Double) {
    point = point / scalar
}

func / (point: CGPoint, scalar: Int) -> CGPoint {
    return point / CGFloat(scalar)
}

func /= (inout point: CGPoint, scalar: Int) {
    point = point / scalar
}


extension CGSize {
    
    init(_ width: CGFloat, _ height: CGFloat) {
       self.init(width: width, height: height)
    }

    init(_ width: Int, _ height: Int) {
        self.init(width: width, height: height)
    }
    
    init(_ width: Double, _ height: Double) {
        self.init(width: width, height: height)
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

func * (size: CGSize, scalar: CGFloat) -> CGSize {
    return CGSize(size.width * scalar, size.height * scalar)
}

func *= (inout size: CGSize, scalar: CGFloat) {
    size = size * scalar
}

func * (size: CGSize, scalar: Double) -> CGSize {
    return size * CGFloat(scalar)
}

func *= (inout size: CGSize, scalar: Double) {
    size = size * scalar
}

func * (size: CGSize, scalar: Int) -> CGSize {
    return size * CGFloat(scalar)
}

func *= (inout size: CGSize, scalar: Int) {
    size = size * scalar
}

func / (lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(lhs.width / rhs.width, lhs.height / rhs.height)
}

func /= (inout lhs: CGSize, rhs: CGSize) {
    lhs = lhs / rhs
}

func / (size: CGSize, scalar: CGFloat) -> CGSize {
    return CGSize(size.width / scalar, size.height / scalar)
}

func /= (inout size: CGSize, scalar: CGFloat) {
    size = size / scalar
}

func / (size: CGSize, scalar: Double) -> CGSize {
    return size / CGFloat(scalar)
}

func /= (inout size: CGSize, scalar: Double) {
    size = size / scalar
}

func / (size: CGSize, scalar: Int) -> CGSize {
    return size / CGFloat(scalar)
}

func /= (inout size: CGSize, scalar: Int) {
    size = size / scalar
}


extension CGRect {
    
    init(_ origin: CGPoint, _ size: CGSize) {
        self.init(origin: origin, size: size)
    }

    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    init(_ x: Double, _ y: Double, _ width: Double, _ height: Double) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    init(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        self.init(x: x, y: y, width: width, height: height)
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
    return rects.reduce(CGRectNull, combine: { CGRectUnion($0, $1) })
}