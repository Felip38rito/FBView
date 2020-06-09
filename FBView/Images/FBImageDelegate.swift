//
//  FBImageDelegate.swift
//  FBKit
//
//  Created by Felipe Correia on 16/01/20.
//  Copyright © 2020 Felip38rito. All rights reserved.
//

import UIKit

/// Control the lifecycle of an FBImageView when loading or storing images
public protocol FBImageDelegate {
    /// Will download a image from internet
    func willDownload(_ imageView: FBImageView, url: String) -> Bool
    /// Did complete the download
    func didDownload(_ imageView: FBImageView, url: String, image: UIImage)
    /// Did load from cache
    func didLoadFromCache(_ imageView: FBImageView, key: String, image: UIImage)
}

/// I'll provide a default implementation for the methods above
public extension FBImageDelegate {
    func willDownload(_ imageView: FBImageView, url: String) -> Bool {
        print("FBImageDelegate: Downloading", url)
        return true
    }
    
    func didDownload(_ imageView: FBImageView, url: String, image: UIImage) {
        print("FBImageDelegate:", url, "download complete")
    }
    
    func didLoadFromCache(_ imageView: FBImageView, key: String, image: UIImage) {
        print("FBImageDelegate:", key, "loaded from cache")
    }
}
