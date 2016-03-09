//
//  UICollectionViewExtensions.swift
//  SFISwiftExtensions

import Foundation
import UIKit

extension UICollectionView {
    enum ElementKind: String {
        case Header,Footer
        var rawValue: String {
            switch self {
            case .Header: return UICollectionElementKindSectionHeader
            case .Footer: return UICollectionElementKindSectionFooter
            }
        }
    }
    
    func registerNibForCellWithType<T: UICollectionViewCell>(type: T.Type) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        registerNib(nib, forCellWithReuseIdentifier: className)
    }
    
    func registerClassForCellWithType<T: UICollectionViewCell>(type: T.Type) {
        registerClass(T.self, forCellWithReuseIdentifier: type.className)
    }
    
    func dequeueReusableCellWithType<T: UICollectionViewCell>(type: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        return dequeueReusableCellWithReuseIdentifier(type.className, forIndexPath: indexPath) as! T
    }
    
    func cellForItemWithType<T: UICollectionViewCell>(type: T.Type, atIndexPath indexPath: NSIndexPath) -> T? {
        return cellForItemAtIndexPath(indexPath) as? T
    }
    
    func registerNibForReusableViewWithType<T: UICollectionReusableView>(type: T.Type, element: ElementKind) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        registerNib(nib, forSupplementaryViewOfKind: element.rawValue, withReuseIdentifier: className)
    }
    
    func registerClassForReusableViewWithType<T: UICollectionReusableView>(type: T.Type, element: ElementKind) {
        registerClass(T.self, forSupplementaryViewOfKind: element.rawValue, withReuseIdentifier: type.className)
    }
    
    func dequeueReusableViewWithType<T: UICollectionReusableView>(type: T.Type, forIndexPath indexPath: NSIndexPath, element: ElementKind) -> T{
        return dequeueReusableSupplementaryViewOfKind(element.rawValue, withReuseIdentifier: type.className, forIndexPath: indexPath) as! T
    }
    
    
}