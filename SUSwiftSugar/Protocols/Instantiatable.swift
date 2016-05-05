//
//  Instantiatable.swift

import Foundation
import UIKit

public protocol NibInstantiatable {
    static var nibName: String { get }
    static var bundle: NSBundle? { get }
}

public extension NibInstantiatable where Self: UIView {
    public static var nibName: String {
        return String(self)
    }
    
    public static var bundle: NSBundle? {
        return nil
    }
    
    public static func instantiate() -> Self {
        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let view = nib.instantiateWithOwner(nil, options: nil).first as? Self else {
            fatalError([
                "Failed to load viewcontroller from nib.",
                "nib: \(nibName), bundle: \(bundle)"
                ].joinWithSeparator(" ")
            )
        }
        return view
    }
}

public protocol StoryboardInstantiatable {
    static var storyboardName: String { get }
    static var viewControllerIdentifier: String? { get }
    static var bundle: NSBundle? { get }
}

extension StoryboardInstantiatable where Self: UIViewController {
    public static var storyboardName: String {
        return String(self)
    }
    
    public static var viewControllerIdentifier: String? {
        return nil
    }
    
    public static var bundle: NSBundle? {
        return nil
    }
    
    public static func instantiate() -> Self {
        let loadViewController = { () -> UIViewController? in
            let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
            if let viewControllerIdentifier = viewControllerIdentifier {
                return storyboard.instantiateViewControllerWithIdentifier(viewControllerIdentifier)
            } else {
                return storyboard.instantiateInitialViewController()
            }
        }
        
        guard let viewController = loadViewController() as? Self else {
            fatalError([
                "Failed to load viewcontroller from storyboard.",
                "storyboard: \(storyboardName), viewControllerID: \(viewControllerIdentifier), bundle: \(bundle)"
                ].joinWithSeparator(" ")
            )
        }
        return viewController
    }
}

public extension StoryboardInstantiatable where Self: UIViewController, Self: RoutingProtocol {
    public static func instantiate(parameter parameter: ParameterType?) -> Self {
        let viewController = instantiate() as Self
        viewController.setupWithParam(parameter)
        return viewController
    }
}