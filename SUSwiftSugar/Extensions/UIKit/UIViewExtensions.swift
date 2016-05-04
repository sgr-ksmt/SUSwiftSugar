//
//  UIViewExtensions.swift

import Foundation
import UIKit

public extension UIView {
    public convenience init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(frame: CGRect(x, y, width, height))
    }

    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame = CGRect(CGPoint(newValue, y), size)
        }
    }
    
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame = CGRect(CGPoint(x, newValue), size)
        }
    }
    
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame = CGRect(origin, CGSize(newValue, height))
        }
    }
    
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame = CGRect(origin, CGSize(width, newValue))
        }
    }
    
    public var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            frame = CGRect(newValue, size)
        }
    }
    
    public var size: CGSize {
        get {
            return frame.size
        }
        set {
            frame = CGRect(origin, newValue)
        }
    }

    public var top: CGFloat {
        get {
            return y
        }
        set {
            y = newValue
        }
    }
    
    public var bottom: CGFloat {
        get {
            return y + height
        }
        set {
            y = newValue - height
        }
    }
    
    public var left: CGFloat {
        get {
            return x
        }
        set {
            x = newValue
        }
    }
    
    public var right: CGFloat {
        get {
            return x + width
        }
        set {
            x = newValue - width
        }
    }
    
    @nonobjc public var center: CGPoint {
        get {
            return CGPoint(frame.midX, frame.midY)
        }
        set {
            self.frame = CGRect(
                CGPoint(
                    newValue.x - width / 2,
                    newValue.y - height / 2
                ),
                size
            )
        }
    }
    
    public var centerX: CGFloat {
        get {
            return frame.midX
        }
        set {
            self.center = CGPoint(newValue, centerY)
        }
    }
    
    public var centerY: CGFloat {
        get {
            return frame.midY
        }
        set {
            self.center = CGPoint(centerX, newValue)
        }
    }
}

public extension UIView {
    public func setCornerRadius(radius radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(radius, radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        layer.mask = mask
    }
    
    public func setShadow(offset offset: CGSize, radius: CGFloat, color: UIColor, opacity: Float, cornerRadius: CGFloat? = nil) {
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowColor = color.CGColor
        guard let cornerRadius = cornerRadius else { return }
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).CGPath
    }
}

public extension UIView {
    public func to_image() -> UIImage {
        return to_image(bounds)
    }
    public func to_image(scale: CGFloat) -> UIImage {
        return to_image(bounds, scale: scale)
    }
    
    public func to_image(rect: CGRect, scale: CGFloat = UIScreen.mainScreen().scale) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, scale)
        let context = UIGraphicsGetCurrentContext()!
        CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y)
        layer.renderInContext(context)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
//        //TODO: change if needed?
//        drawViewHierarchyInRect(rect, afterScreenUpdates: false)
//        let img = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
        return img
    }
}

public enum FadeAnimationType: NSTimeInterval {
    case Fast = 0.15
    case Normal = 0.35
    case Slow = 1.0
}

public extension UIView {
    public func fadeIn(type type: FadeAnimationType = .Normal, completion: (() -> Void)? = nil) {
        fadeIn(duration: type.rawValue, completion: completion)
    }
    
    public func fadeIn(duration duration: NSTimeInterval, completion: (() -> Void)? = nil) {
        alpha = 0.0
        hidden = false
        UIView.animateWithDuration(duration, animations: { [weak self] in
            self?.alpha = 1.0
        }) { _ in
            completion?()
        }
    }
    
    public func fadeOut(completion: (() -> Void)) {
        fadeOut(type: .Normal, completion: completion)
    }
    
    public func fadeOut(type type: FadeAnimationType = .Normal, completion: (() -> Void)? = nil) {
        fadeOut(duration: type.rawValue, completion: completion)
    }
    
    public func fadeOut(duration duration: NSTimeInterval, completion: (() -> Void)? = nil) {
        UIView.animateWithDuration(duration, animations: { [weak self] in
            self?.alpha = 0
        }) { [weak self] finished in
            self?.hidden = true
            self?.alpha = 1
            completion?()
        }
    }
    
}