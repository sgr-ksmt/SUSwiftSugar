//
//  CustomXibReusable.swift

import Foundation
import UIKit

protocol CustomXibReusable {
    var vPadding: CGFloat { get }
    var hPadding: CGFloat { get }
    init(frame: CGRect)
    init?(coder aDecoder: NSCoder)
}

private let MainViewTag = 1 << 16

private struct AssociatedKeys {
    private init() {}
    static var mainViewKey = "mainView"
}

extension CustomXibReusable where Self: UIView {
    var vPadding: CGFloat { return 0.0 }
    var hPadding: CGFloat { return 0.0 }
    
    var mainView: Self {
        return viewWithTag(MainViewTag) as! Self
    }
    
    func loadFromNib() {
        let view = NSBundle
            .mainBundle()
            .loadNibNamed(String(Self), owner: self, options: nil)
            .first as! Self
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
