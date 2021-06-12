//
//  AlbumListViewModel.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import Foundation

protocol AlbumListBusinessLogic: AnyObject {
    
    func fetchAlbumList()
}

class AlbumListViewModel {
    
    let albumService: AlbumService
    weak var viewController: AlbumViewController?
    
    init(albumService: AlbumService) {
        
        self.albumService = albumService
    }
}

extension AlbumListViewModel: AlbumListBusinessLogic {
    
    func fetchAlbumList() {
        
    }
}
