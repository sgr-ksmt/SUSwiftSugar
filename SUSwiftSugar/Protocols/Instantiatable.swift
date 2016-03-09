//
//  Instantiatable.swift

import Foundation
import UIKit

public protocol NibInstantiatable {
    static var nibName: String { get }
}

public extension NibInstantiatable where Self: UIView {
    public static var nibName: String { return TypeName(Self) }
    
    public static func instantiate() -> Self {
        return instantiateWithName(nibName)
    }
    
    public static func instantiateWithOwner(owner: AnyObject?) -> Self {
        return instantiateWithName(nibName, owner: owner)
    }
    
    public static func instantiateWithName(name: String, owner: AnyObject? = nil) -> Self {
        let nib = UINib(nibName: name, bundle: nil)
        return nib.instantiateWithOwner(owner, options: nil).first as! Self
    }
}

public protocol StoryboardInstantiatable {
    static var storyboardName: String { get }
}

extension StoryboardInstantiatable where Self: UIViewController {
    public static var storyboardName: String { return TypeName(Self) }
    
    public static func instantiate() -> Self {
        return instantiateWithName(storyboardName)
    }
    
    public static func instantiateWithBundle(bundle: NSBundle?) -> Self {
        return instantiateWithName(storyboardName, bundle: bundle)
    }
    
    public static func instantiateWithName(name: String, bundle: NSBundle? = nil) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        return storyboard.instantiateInitialViewController() as! Self
    }
}