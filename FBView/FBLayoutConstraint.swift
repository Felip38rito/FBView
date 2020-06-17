//
//  FBLayoutConstraint.swift
//  FBKit
//
//  Created by Felipe Correia on 05/03/20.
//  Copyright © 2020 Felip38rito. All rights reserved.
//

import UIKit

@IBDesignable
open class FBLayoutConstraint: NSLayoutConstraint {
    
    internal var previousConstantValue: CGFloat = 0.0
    
    @IBInspectable open var valueForSE: CGFloat = 0.0 {
        didSet {
            if UIDevice.current.iPhone {
                if UIDevice.current.screenFamily == .iPhoneSmall {
                    previousConstantValue = self.constant
                    self.constant = self.valueForSE
                }
            }
        }
    }
    
    @IBInspectable open var valueFor8: CGFloat = 0.0 {
        didSet {
            if UIDevice.current.iPhone {
                if UIDevice.current.screenFamily == .iPhoneStandard {
                    previousConstantValue = self.constant
                    self.constant = self.valueFor8
                }
            }
        }
    }
    
    @IBInspectable open var valueForX: CGFloat = 0.0 {
        didSet {
            if UIDevice.current.iPhone {
                if UIDevice.current.screenFamily == .iPhoneX {
                    previousConstantValue = self.constant
                    self.constant = self.valueForX
                }
            }
        }
    }
    
    @IBInspectable open var valueForPhonePlus: CGFloat = 0.0 {
        didSet {
            if UIDevice.current.iPhone {
                if UIDevice.current.screenFamily == .iPhonePlus {
                    previousConstantValue = self.constant
                    self.constant = self.valueForPhonePlus
                }
            }
        }
    }
}

internal extension UIDevice {
    var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    var iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    enum ScreenType: String {
        case iPhones_4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhones_X_XS = "iPhone X or iPhone XS"
        case iPhone_XR = "iPhone XR"
        case iPhone_XSMax = "iPhone XS Max"
        case unknown
    }
    
    enum ScreenFamily {
        case iPhoneX
        case iPhonePlus
        case iPhoneStandard
        case iPhoneSmall
    }
    
    var screenFamily: ScreenFamily {
        switch screenType {
        case .iPhones_4_4S, .iPhones_5_5s_5c_SE:
            return .iPhoneSmall
        case .iPhones_6_6s_7_8:
            return .iPhoneStandard
        case .iPhone_XR, .iPhones_X_XS, .iPhone_XSMax:
            return .iPhoneX
        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
            return .iPhonePlus
        case .unknown:
            return .iPhoneStandard
        }
    }
    
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhones_4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1792:
            return .iPhone_XR
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2436:
            return .iPhones_X_XS
        case 2688:
            return .iPhone_XSMax
        default:
            return .unknown
        }
    }
}
