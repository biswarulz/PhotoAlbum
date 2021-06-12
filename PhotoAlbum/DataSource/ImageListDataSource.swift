//
//  ImageListDataSource.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import UIKit

class ImageListDataSource {
    
    var cellViewData: [ImageListCellViewData]
    
    init(cellViewData: [ImageListCellViewData]) {
        
        self.cellViewData = cellViewData
    }
}
