//
//  UIImageView.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import UIKit
import AlamofireImage

extension UIImageView {
    
    /// Loads image asynchronously with in memory cache
    /// - Parameter url: image url to be loaded
    func setAFImage(for url: URL) {
        
        af.setImage(withURL: url, placeholderImage: UIImage(named: Identifiers.placeHolderImage), progressQueue: .main, imageTransition: .crossDissolve(0.4), runImageTransitionIfCached: false)
    }
}
