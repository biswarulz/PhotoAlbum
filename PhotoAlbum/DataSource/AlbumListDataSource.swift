//
//  AlbumListDataSource.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import UIKit

class AlbumListDataSource: NSObject {
    
    let cellViewData: [AlbumListCellViewData]
    
    init(cellViewData: [AlbumListCellViewData]) {
        
        self.cellViewData = cellViewData
    }
}

extension AlbumListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumListTableViewCell.cellIdentifier) as? AlbumListTableViewCell else {
            
            return UITableViewCell()
        }
        let cellData = cellViewData[indexPath.row]
        cell.fillData(cellData)
        return cell
    }
}
