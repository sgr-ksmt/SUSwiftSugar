//
//  UIViewExtensions.swift

import Foundation
import UIKit

extension UIView {
    convenience init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(frame: CGRect(x, y, width, height))
    }

    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame = CGRect(CGPoint(newValue, y), size)
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame = CGRect(CGPoint(x, newValue), size)
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame = CGRect(origin, CGSize(newValue, height))
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame = CGRect(origin, CGSize(width, newValue))
        }
    }
    
    var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            frame = CGRect(newValue, size)
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            frame = CGRect(origin, newValue)
        }
    }

    var top: CGFloat {
        get {
            return y
        }
        set {
            y = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            return y + height
        }
        set {
            y = newValue - height
        }
    }
    
    var left: CGFloat {
        get {
            return x
        }
        set {
            x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return x + width
        }
        set {
            x = newValue - width
        }
    }
}

extension UIView {
    func setCornerRadius(radius radius: CGFloat) {
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

extension UIView {
    func to_image() -> UIImage {
        return to_image(bounds)
    }
    func to_image(scale: CGFloat) -> UIImage {
        return to_image(bounds, scale: scale)
    }
    
    func to_image(rect: CGRect, scale: CGFloat = UIScreen.mainScreen().scale) -> UIImage {
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

enum FadeAnimationType: NSTimeInterval {
    case Fast = 0.15
    case Normal = 0.35
    case Slow = 1.0
}

extension UIView {
    func fadeIn(type type: FadeAnimationType = .Normal, completion: (() -> Void)? = nil) {
        fadeIn(duration: type.rawValue, completion: completion)
    }
    
    func fadeIn(duration duration: NSTimeInterval, completion: (() -> Void)? = nil) {
        alpha = 0.0
        hidden = false
        UIView.animateWithDuration(duration, animations: { [weak self] in
            self?.alpha = 1.0
        }) { _ in
            completion?()
        }
    }
    
    func fadeOut(completion: (() -> Void)) {
        fadeOut(type: .Normal, completion: completion)
    }
    
    func fadeOut(type type: FadeAnimationType = .Normal, completion: (() -> Void)? = nil) {
        fadeOut(duration: type.rawValue, completion: completion)
    }
    
    func fadeOut(duration duration: NSTimeInterval, completion: (() -> Void)? = nil) {
        UIView.animateWithDuration(duration, animations: { [weak self] in
            self?.alpha = 0
        }) { [weak self] finished in
            self?.hidden = true
            self?.alpha = 1
            completion?()
        }
    }
    
}