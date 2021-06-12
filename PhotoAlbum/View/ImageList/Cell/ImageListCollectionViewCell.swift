//
//  ImageListCollectionViewCell.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import UIKit

class ImageListCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "ImageListCell"
    let photoImageView: UIImageView
    
    override init(frame: CGRect) {
        
        photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: frame)
        contentView.addSubview(photoImageView)
        addCustomConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Fill data for image
    /// - Parameter data: photo details
    func fillData(data: ImageListCellViewData) {
        
        if let imageURL = URL(string: data.thumbnailUrl) {
            
            photoImageView.setAFImage(for: imageURL)
        }
    }
    
    private func addCustomConstraints() {
        
        NSLayoutConstraint.activate([
            
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
