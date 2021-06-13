//
//  ImageListCollectionViewCell.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import UIKit

class ImageListCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "ImageListCell"
    private let photoImageView: UIImageView
    private let infoView: UIView
    private let infoLabel: UILabel
    
    override init(frame: CGRect) {
        
        photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        
        infoView = UIView()
        infoView.backgroundColor = .seeThroughBlack
        
        infoLabel = UILabel()
        infoLabel.textColor = .white
        infoLabel.numberOfLines = 0
        infoLabel.font = UIFont.systemFont(ofSize: 12.0)
        infoLabel.textAlignment = .center
        
        super.init(frame: frame)
        
        infoView.addSubViewsForAutoLayout([infoLabel])
        contentView.addSubViewsForAutoLayout([photoImageView, infoView])
        addCustomConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Fill data for image
    /// - Parameter data: photo details
    func fillData(data: ImageListCellViewData) {
        
        if let imageURL = URL(string: data.imageUrl) {
            
            photoImageView.setAFImage(for: imageURL)
        }
        infoLabel.text = data.title
    }
    
    private func addCustomConstraints() {
        
        NSLayoutConstraint.activate([
            
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            infoView.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor),
            infoView.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor),
            infoView.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor),
            infoView.heightAnchor.constraint(equalTo: photoImageView.heightAnchor, multiplier: 0.2),
            
            infoLabel.topAnchor.constraint(equalTo: infoView.topAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor)
        ])
    }
}
