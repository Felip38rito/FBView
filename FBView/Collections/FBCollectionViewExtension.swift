//
//  FBCollectionViewExtension.swift
//  FBView
//
//  Created by Felipe Correia on 18/06/20.
//  Copyright © 2020 felip38rito. All rights reserved.
//

import UIKit


/// A reusable view who can be identified by some string, by default the name of the UIView class
public protocol FBReusableView {
    static var reuseIdentifier: String { get }
}

public extension FBReusableView {
    static var reuseIdentifier: String {
        get {
            return String(describing: self)
        }
    }
}

extension UICollectionViewCell: FBReusableView {
    
}

/// Now we'll extend the UICollectionView to be able to reuse views in a more solid way
public extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Can't dequeue with type \(String(describing: T.self) )")
        }
        
        return cell
    }
}
