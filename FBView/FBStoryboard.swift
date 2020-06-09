//
//  FBStoryboard.swift
//  FBKit
//
//  Created by Felipe Correia on 05/01/20.
//  Copyright © 2020 Felip38rito. All rights reserved.
//
import UIKit

public class FBStoryboard {
    /// Retrieve an UIViewController instance from an Storyboard with the identifier as string with the name of the controller
    /// - Parameter viewControllerClass: Type of the controller(inherits UIViewController) that will be received
    /// - Parameter storyboardName: A string representing the name of the Storyboard in main bundle
    public class func viewController<T: UIViewController>(viewControllerClass: T.Type, storyboardName: String) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).fbStoryboardID
        return UIStoryboard(name: storyboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: storyboardID) as! T
    }
}

public extension UIViewController {
    class var fbStoryboardID: String {
        return "\(self)"
    }
    
    /// Create an instance of this view controller from the informed storyboard or XIB
    /// Note: If you pass "XIB" to storyboard name, it will load the UIViewController from it's xib with same name
    /// - Parameter from: The storyboard name, with "xib" (case insensitive) as a reserved keyword
    class func instantiate(from storyboard: String) -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        
        if storyboard.uppercased() == "XIB" {
            return instantiateFromNib()
        }
        return FBStoryboard.viewController(viewControllerClass: self, storyboardName: storyboard)
    }
}
