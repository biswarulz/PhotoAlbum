//
//  ImageListView.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import UIKit

class ImageListView: GenericView {
    
    let imageListCollectionView: UICollectionView
    
    /// constant values used
    private struct ViewTraits {
        
        static let minimumInteritemSpacing: CGFloat = 0.0
        static let minimumLineSpacing: CGFloat = 0.0
    }
    
    override init(frame: CGRect) {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumInteritemSpacing = ViewTraits.minimumInteritemSpacing
        collectionViewLayout.minimumLineSpacing = ViewTraits.minimumLineSpacing
        collectionViewLayout.scrollDirection = .vertical
        imageListCollectionView = UICollectionView(frame: frame, collectionViewLayout: collectionViewLayout)
        //imageListCollectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        imageListCollectionView.backgroundColor = .systemBackground
        imageListCollectionView.register(ImageListCollectionViewCell.self, forCellWithReuseIdentifier: ImageListCollectionViewCell.cellIdentifier)
        imageListCollectionView.showsVerticalScrollIndicator = false
        
        super.init(frame: frame)
        
        addSubViewsForAutoLayout([imageListCollectionView])
        addCustomConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addCustomConstraints() {
        
        NSLayoutConstraint.activate([
            
            imageListCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageListCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageListCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageListCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
