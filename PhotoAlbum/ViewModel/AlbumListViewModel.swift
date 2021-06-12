//
//  AlbumListViewModel.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import Foundation
import Combine

protocol AlbumListBusinessLogic: AnyObject {
    
    func fetchAlbumList()
    func fetchSearchedAlbumList(forText text: String)
}

class AlbumListViewModel {
    
    let albumService: AlbumService
    weak var viewController: AlbumListDisplayLogic?
    private var albumList: [Album] = []
    private var cancellableSubscribers = Set<AnyCancellable>()
    
    init(albumService: AlbumService) {
        
        self.albumService = albumService
    }
}

extension AlbumListViewModel: AlbumListBusinessLogic {
    
    func fetchAlbumList() {
        
        guard let url = URL(string: Identifiers.albumNetworkURL) else { return }
        
        albumService.getAlbumList(url: url)
            .receive(on: DispatchQueue.main).sink { (completion) in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error)
            }
        } receiveValue: { (albums) in
            
            self.albumList = albums
            self.presentAlbumList(albums)
        }.store(in: &cancellableSubscribers)

    }
    
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
        
       let viewData = albums.enumerated().map({ AlbumListCellViewData(albumId: $1.albumId, title: $1.title, serialNo: "\($0 + 1)") })
        viewController?.displayAlbumList(withTitle: "Albums", data: viewData)
    }
}
