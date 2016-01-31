//
//  UITableViewExtensions.swift

import Foundation
import UIKit

extension UITableView {
    
    func registerNibForCellWithType<T: UITableViewCell>(type: T.Type) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        registerNib(nib, forCellReuseIdentifier: className)
    }
    
    func registerClassForCellWithType<T: UITableViewCell>(type: T.Type) {
        registerClass(T.self, forCellReuseIdentifier: type.className)
    }
    
    func dequeueReusableCellWithType<T: UITableViewCell>(type: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        return dequeueReusableCellWithIdentifier(type.className, forIndexPath: indexPath) as! T
    }
    
    func registerNibForHeaderFooterWithType<T: UITableViewHeaderFooterView>(type: T.Type) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        registerNib(nib, forHeaderFooterViewReuseIdentifier: className)
    }
    
    func registerClassForHeaderFooterWithType<T: UITableViewHeaderFooterView>(type: T.Type) {
        registerClass(T.self, forHeaderFooterViewReuseIdentifier: type.className)
    }
    
    func dequeueReusableHeaderFooterWithType<T: UITableViewHeaderFooterView>(type: T.Type) -> T {
        return dequeueReusableHeaderFooterViewWithIdentifier(type.className) as! T
    }

}