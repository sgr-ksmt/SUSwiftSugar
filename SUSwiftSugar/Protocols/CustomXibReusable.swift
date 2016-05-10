//
//  CustomXibReusable.swift

import Foundation
import UIKit

protocol CustomXibReusable {
    var vPadding: CGFloat { get }
    var hPadding: CGFloat { get }
    var nibName: String { get }
}

private let MainViewTag = 1 << 16

private struct AssociatedKeys {
    private init() {}
    static var mainViewKey = "mainView"
}

extension CustomXibReusable where Self: UIView {
    var vPadding: CGFloat { return 0.0 }
    var hPadding: CGFloat { return 0.0 }
    var nibName: String {
        return String(self)
    }
    
    var mainView: UIView {
        return viewWithTag(MainViewTag)!
    }
    
    func loadFromNib() {
        let view = NSBundle
            .mainBundle()
            .loadNibNamed(nibName, owner: self, options: nil)
            .first as! UIView
        addSubview(view)
        setupConstraints(view)
    }
    
    private func setupConstraints(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        let viewsDic = ["view": view]
        self.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|-vPadding-[view]-vPadding-|",
                options: [],
                metrics: ["vPadding": vPadding],
                views: viewsDic
            )
        )
        self.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|-hPadding-[view]-hPadding-|",
                options: [],
                metrics: ["hPadding": hPadding],
                views: viewsDic
            )
        )
    }
}
