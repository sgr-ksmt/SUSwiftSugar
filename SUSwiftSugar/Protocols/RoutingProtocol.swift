//
//  RoutingProtocol.swift
//  SUSwiftSugar
//
//  Created by Suguru Kishimoto on 2016/03/23.
//
//

import Foundation

public protocol RoutingProtocol {
    associatedtype ParameterType = AnyObject
    
    func presentViewController<To: RoutingProtocol where To: UIViewController>
        (viewController: To, parameter: To.ParameterType?, animated: Bool, completion: (() -> Void)?)
    func pushViewController<To: RoutingProtocol where To: UIViewController>
        (viewController: To, parameter: To.ParameterType?, animated: Bool)
    func setupWithParameter(parameter: ParameterType?)
}

public extension RoutingProtocol where Self: UIViewController {
    func setupWithParam(params: ParameterType?) {
    
    }
    
    func presentViewController<To: RoutingProtocol where To: UIViewController>
        (viewController: To, parameter: To.ParameterType?, animated: Bool = true, completion: (() -> ())? = nil) {
            viewController.setupWithParameter(parameter)
            presentViewController(viewController, animated: animated, completion: completion)
    }
    
    func pushViewController<To: RoutingProtocol where To: UIViewController>
        (viewController: To, parameter: To.ParameterType?, animated: Bool = true) {
            viewController.setupWithParameter(parameter)
            self.navigationController?.pushViewController(viewController, animated: animated)
    }
}
