//
//  Instantiatable.swift

import Foundation
import UIKit

public protocol NibInstantiatable {
    static var nibName: String { get }
}

public extension NibInstantiatable where Self: UIView {
    public static var nibName: String {
        return TypeName(Self)
    }
    
    public static func instantiate() -> Self {
        return instantiateWithName(nibName)
    }
    
    public static func instantiateWithOwner(owner: AnyObject) -> Self {
        return instantiateWithName(nibName, owner: owner)
    }
    
    public static func instantiateWithName(name: String, owner: AnyObject? = nil) -> Self {
        let nib = UINib(nibName: name, bundle: nil)
        return nib.instantiateWithOwner(owner, options: nil).first as! Self
    }
}

public protocol StoryboardInstantiatable {
    static var storyboardName: String { get }
    static var viewControllerIdentifier: String? { get }
}

extension StoryboardInstantiatable where Self: UIViewController {
    public static var storyboardName: String {
        return TypeName(Self)
    }
    
    public static var viewControllerIdentifier: String? {
        return nil
    }
    
    public static func instantiate() -> Self {
        return instantiateWithStoryboardName(storyboardName, viewControllerIdentifier: viewControllerIdentifier)
    }
    
    public static func instantiateWithStoryboardName(name: String, viewControllerIdentifier: String? = nil, bundle: NSBundle? = nil) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        if let viewControllerIdentifier = viewControllerIdentifier {
            return storyboard.instantiateViewControllerWithIdentifier(viewControllerIdentifier) as! Self
        } else {
            return storyboard.instantiateInitialViewController() as! Self
        }
    }
}

public extension StoryboardInstantiatable where Self: UIViewController, Self: RoutingProtocol {

    public static func instantiate() -> Self {
        fatalError("Use instantiate(parameter:) instead.")
    }
    
    public static func instantiateWithStoryboardName(name: String, viewControllerIdentifier: String? = nil, bundle: NSBundle? = nil) -> Self {
        fatalError("Use instantiateWithStoryboardName(_:viewControllerIdentifier:bundle:parameter:) instead.")
    }
    
    public static func instantiate(parameter parameter: ParameterType?) -> Self {
        return instantiateWithStoryboardName(storyboardName, viewControllerIdentifier: viewControllerIdentifier, parameter: parameter)
    }
    
    public static func instantiateWithStoryboardName(name: String, viewControllerIdentifier: String? = nil, bundle: NSBundle? = nil, parameter: ParameterType?) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        let viewControler = storyboard.instantiateInitialViewController() as! Self
        viewControler.setupWithParameter(parameter)
        return viewControler
    }
    
}