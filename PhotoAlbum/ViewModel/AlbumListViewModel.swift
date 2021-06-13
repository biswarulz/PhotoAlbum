//
//  AlbumListViewModel.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import Foundation

protocol AlbumListBusinessLogic: AnyObject {
    
    func fetchAlbumList()
    func fetchSearchedAlbumList(forText text: String)
}

class AlbumListViewModel {
    
    let albumService: AlbumService
    weak var viewController: AlbumListDisplayLogic?
    private var albumList: [Album] = []
    
    init(albumService: AlbumService) {
        
        self.albumService = albumService
    }
}

extension AlbumListViewModel: AlbumListBusinessLogic {
    
    /// Fetches full album list
    func fetchAlbumList() {
                
        albumService.getAlbumList { (result) in
            
            switch result {
            case .success(let albumList):
                self.albumList = albumList
                self.presentAlbumList(albumList)
            case .failure(_):
                self.presentServerError()
            }
        }

    }
    
    /// Fetches searched result based on the text
    /// - Parameter text: searched text
    func fetchSearchedAlbumList(forText text: String) {
        
        guard !text.isEmpty else {
            
            presentAlbumList(albumList)
            return
        }
        
        let filteredList = albumList.filter({ $0.title.lowercased().contains(text) })
        presentAlbumList(filteredList)
    }
}

extension AlbumListViewModel {
    
    private func presentAlbumList(_ albums: [Album]) {
        
        let viewData = albums.map({ AlbumListCellViewData(albumId: $0.albumId, title: $0.title, serialNo: "\($0.albumId)") })
        viewController?.displayAlbumList(withTitle: "Albums", data: viewData)
    }
    
    private func presentServerError() {
        
        viewController?.displayServerError()
    }
}
