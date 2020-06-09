//
//  FBImageCache.swift
//  FBKit
//
//  Created by Felipe Correia on 16/01/20.
//  Copyright © 2020 Felip38rito. All rights reserved.
//

import UIKit

// Simple cache helper for images stored in memory using NSCache
public class FBImageCache {
    internal let cache = NSCache<NSString, UIImage>()
    
    public static let current = FBImageCache()
    /// Impossible to instance from its own
    private init() {  }
    
    /// Store the image in cache for key
    /// - Parameter image: UIImage instance to store
    /// - Parameter key: String defining the key to receive the image
    public func store(image: UIImage, key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    /// Get the image stored in cache from key
    /// - Parameter key: String key which had an image associated
    public func get(key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }
}
