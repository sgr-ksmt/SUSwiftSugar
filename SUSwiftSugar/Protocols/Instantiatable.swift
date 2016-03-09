//
//  Instantiatable.swift

import Foundation
import UIKit

protocol NibInstantiatable {
    static var nibName: String { get }
}

extension NibInstantiatable where Self: UIView {
    
    static var nibName: String { return TypeName(Self) }
    
    static func instantiate() -> Self {
        return instantiateWithName(nibName)
    }
    
    static func instantiateWithOwner(owner: AnyObject?) -> Self {
        return instantiateWithName(nibName, owner: owner)
    }
    
    static func instantiateWithName(name: String, owner: AnyObject? = nil) -> Self {
        let nib = UINib(nibName: name, bundle: nil)
        guard let view = nib.instantiateWithOwner(owner, options: nil).first as? Self else {
            fatalError("failed to load \(name) nib file")
        }
        return view
    }
    
}

protocol StoryboardInstantiatable {
    static var storyboardName: String { get }
}

extension StoryboardInstantiatable where Self: UIViewController {
    
    static var storyboardName: String { return TypeName(Self) }
    
    static func instantiate() -> Self {
        return instantiateWithName(storyboardName)
    }
    
    static func instantiateWithBundle(bundle: NSBundle?) -> Self {
        return instantiateWithName(storyboardName, bundle: bundle)
    }
    
    static func instantiateWithName(name: String, bundle: NSBundle? = nil) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        guard let vc = storyboard.instantiateInitialViewController() as? Self else{
            fatalError("failed to load \(name) storyboard file.")
        }
        return vc
    }
    
}