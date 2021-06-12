//
//  AlbumListView.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 11/06/21.
//

import UIKit

class AlbumListView: UIView {
    
    let tableView: UITableView
    
    /// constant values used
    private struct ViewTraits {
        
        static let estimatedRowHeight: CGFloat = 44.0
    }
    
    override init(frame: CGRect) {
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AlbumListTableViewCell.self, forCellReuseIdentifier: AlbumListTableViewCell.cellIdentifier)
        tableView.estimatedRowHeight = ViewTraits.estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubViewsForAutoLayout([tableView])
        addCustomConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addCustomConstraints() {
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
