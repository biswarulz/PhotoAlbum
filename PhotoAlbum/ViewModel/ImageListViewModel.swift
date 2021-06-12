//
//  ImageListViewModel.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import Foundation
import Combine

protocol ImageListBusinessLogic: AnyObject {
    
    func fetchImageList()
}

class ImageListViewModel {
    
    let imageService: ImageService
    weak var viewController: ImageListDisplayLogic?
    private var imageList: [Photo] = []
    private var cancellableSubscribers = Set<AnyCancellable>()
    
    init(imageService: ImageService) {
        
        self.imageService = imageService
    }
}

extension ImageListViewModel: ImageListBusinessLogic {
    
    func fetchImageList() {
        
    }
}
