//
//  AlbumListTableViewCell.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import UIKit

class AlbumListTableViewCell: UITableViewCell {

    let serialNoLabel: UILabel
    let albumTextlabel: UILabel
    let wrapperView: UIView
    
    static let cellIdentifier = "AlbumListCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        serialNoLabel = UILabel()
        serialNoLabel.textColor = .white
        serialNoLabel.backgroundColor = .blue
        serialNoLabel.layer.cornerRadius = 30.0/2
        serialNoLabel.clipsToBounds = true
        serialNoLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
        serialNoLabel.textAlignment = .center
        
        albumTextlabel = UILabel()
        albumTextlabel.textColor = .blue
        albumTextlabel.font = UIFont.systemFont(ofSize: 18.0)
        albumTextlabel.numberOfLines = 2
        
        wrapperView = UIView()
        wrapperView.backgroundColor = .lightGray
        wrapperView.layer.cornerRadius = 10.0
        wrapperView.addSubViewsForAutoLayout([serialNoLabel, albumTextlabel])
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubViewsForAutoLayout([wrapperView])
        addCustomConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillData(_ data: AlbumListCellViewData) {
        
        serialNoLabel.text = data.serialNo
        albumTextlabel.text = data.title
    }
    
    private func addCustomConstraints() {
        
        NSLayoutConstraint.activate([
            
            wrapperView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            wrapperView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            wrapperView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
            wrapperView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0),
            
            serialNoLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 10.0),
            serialNoLabel.heightAnchor.constraint(equalToConstant: 30.0),
            serialNoLabel.widthAnchor.constraint(equalToConstant: 30.0),
            serialNoLabel.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            
            albumTextlabel.leadingAnchor.constraint(equalTo: serialNoLabel.trailingAnchor, constant: 10.0),
            albumTextlabel.topAnchor.constraint(equalTo: wrapperView.topAnchor),
            albumTextlabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -10.0),
            albumTextlabel.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor)
        ])
    }
}
