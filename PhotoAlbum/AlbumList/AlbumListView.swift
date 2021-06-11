//
//  AlbumListView.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 11/06/21.
//

import UIKit

class AlbumListView: UIView {
    
    let tableView: UITableView
    
    override init(frame: CGRect) {
        
        tableView = UITableView()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
