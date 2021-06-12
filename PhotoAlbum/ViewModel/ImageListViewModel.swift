//
//  ImageListViewModel.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import Foundation

protocol ImageListBusinessLogic: AnyObject {
    
    func fetchImageList()
}

class ImageListViewModel {
    
    let imageService: ImageService
    weak var viewController: ImageListDisplayLogic?
    private var imageList: [Photo] = []
    private let albumContext: AlbumContext
    
    init(imageService: ImageService, albumContext: AlbumContext) {
        
        self.imageService = imageService
        self.albumContext = albumContext
    }
}

extension ImageListViewModel: ImageListBusinessLogic {
    
    func fetchImageList() {
        
        imageService.getImageListForSpecificAlbum(albumContext.albumId) { (result) in
            
            switch result {
            case .success(let imageList):
                self.imageList = imageList
                self.presentImageList(imageList)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ImageListViewModel {
    
    private func presentImageList(_ data: [Photo]) {
        
        let viewData = data.map({ ImageListCellViewData(title: $0.title, imageUrl: $0.url, thumbnailUrl: $0.thumbnailUrl) })
        viewController?.displayImageList(forTitle: "Gallery", viewData: viewData)
    }
}
