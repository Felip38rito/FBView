//
//  FBLabel.swift
//  FBKit
//
//  Created by Felipe Correia on 29/04/20.
//  Copyright © 2020 Felip38rito. All rights reserved.
//
import UIKit

@IBDesignable
/// Just a simple extension to "select font size from screen type" of iPhones.
open class FBLabel: UILabel {
    
    @IBInspectable
    /// Size for iphones of the first gen SE small screens type
    var sizeForSe: CGFloat = 0.0 {
        didSet {
            if sizeForSe != 0.0 && UIDevice.current.iPhone && UIDevice.current.screenFamily == .iPhoneSmall {
                self.font = UIFont(name: self.font.fontName, size: sizeForSe)
            }
        }
    }
    
    @IBInspectable
    /// Size for iphones within the X/11 family
    var sizeForX: CGFloat = 0.0 {
        didSet {
            if sizeForX != 0.0 && UIDevice.current.iPhone && UIDevice.current.screenFamily == .iPhoneX {
                self.font = UIFont(name: self.font.fontName, size: sizeForSe)
            }
        }
    }
    
    /// Size for the standard iPhone size (8/7/6)
    @IBInspectable open var valueFor8: CGFloat = 0.0 {
        didSet {
            if valueFor8 != 0.0 && UIDevice.current.iPhone && UIDevice.current.screenFamily == .iPhoneStandard {
                self.font = UIFont(name: self.font.fontName, size: valueFor8)
            }
        }
    }
}
