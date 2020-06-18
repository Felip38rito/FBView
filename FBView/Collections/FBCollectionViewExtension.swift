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

/// Now we'll extend the UICollectionView to be able to reuse views in a more solid way
public extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: FBReusableView {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UICollectionReusableView>(_: T.Type, forSupplementaryViewOfKind kind: String) where T: FBReusableView {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: FBReusableView, T: FBNib {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: FBReusableView {
        register(T.self)
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier , for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: FBReusableView, T: FBNib {
        register(T.self)
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String, for indexPath: IndexPath) -> T where T: FBReusableView {
        register(T.self, forSupplementaryViewOfKind: kind)
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue reusable supplementaryView with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
