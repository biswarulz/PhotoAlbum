//
//  ImageListDataSource.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import UIKit

class ImageListDataSource: NSObject {
    
    var cellViewData: [ImageListCellViewData]
    
    init(cellViewData: [ImageListCellViewData]) {
        
        self.cellViewData = cellViewData
    }
}

extension ImageListDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cellViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageListCollectionViewCell.cellIdentifier, for: indexPath) as? ImageListCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        let cellData = cellViewData[indexPath.row]
        cell.fillData(data: cellData)
        
        return cell
    }
    
}
