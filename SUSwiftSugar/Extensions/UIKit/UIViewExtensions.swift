//
//  UIViewExtensions.swift

import Foundation
import UIKit

extension UIView {
    
    convenience init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(frame: CGRect(x, y, width, height))
    }
    
    var x: CGFloat {
        get { return self.frame.origin.x }
        set { self.frame = CGRect(CGPoint(newValue, self.y), self.size) }
    }
    var y: CGFloat {
        get { return self.frame.origin.y }
        set { self.frame = CGRect(CGPoint(self.x, newValue), self.size) }
    }
    var width: CGFloat {
        get { return self.frame.size.width }
        set { self.frame = CGRect(self.origin, CGSize(newValue, self.height)) }
    }
    var height: CGFloat {
        get { return self.frame.size.height }
        set { self.frame = CGRect(self.origin, CGSize(self.width, newValue)) }
    }
    
    var origin: CGPoint {
        get { return self.frame.origin }
        set { self.frame = CGRect(newValue, self.size) }
    }
    var size: CGSize {
        get { return self.frame.size }
        set { self.frame = CGRect(self.origin, newValue) }
    }

    var top: CGFloat {
        get { return self.y }
        set { self.y = newValue }
    }
    var bottom: CGFloat {
        get { return self.y + self.height }
        set { self.y = newValue - self.height }
    }
    var left: CGFloat {
        get { return self.x }
        set { self.x = newValue }
    }
    var right: CGFloat {
        get { return self.x + self.width }
        set { self.x = newValue - self.width }
    }

}

extension UIView {
    
    func setCornerRadius(radius radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(radius, radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
    }
    
    public func setShadow(offset offset: CGSize, radius: CGFloat, color: UIColor, opacity: Float, cornerRadius: CGFloat? = nil) {
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = color.CGColor
        guard let cornerRadius = cornerRadius else { return }
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).CGPath
    }
}

extension UIView {
    
    func to_image() -> UIImage {
        return to_image(self.bounds)
    }
    func to_image(scale: CGFloat) -> UIImage {
        return to_image(self.bounds, scale: scale)
    }
    
    func to_image(rect: CGRect, scale: CGFloat = UIScreen.mainScreen().scale) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, scale)
        let context = UIGraphicsGetCurrentContext()!
        CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y)
        self.layer.renderInContext(context)
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
        self.alpha = 0.0
        self.hidden = false
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