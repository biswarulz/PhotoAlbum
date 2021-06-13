//
//  PhotoListCoordinator.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import UIKit

class ImageListCoordinator: Coordinator<Void> {
    
    private var navigationController: UINavigationController
    private var viewController: ImageListViewController
    private let albumContext: AlbumContext
    
    init(albumContext: AlbumContext, navigationController: UINavigationController) {
        
        self.navigationController = navigationController
        viewController = ImageListViewController(imageListDataSource: ImageListDataSource(cellViewData: []))
        self.albumContext = albumContext
        super.init()
        setUp()
    }
    
    private func setUp() {
        
        let service: ImageService = ImageServiceClient()
        let viewModel = ImageListViewModel(imageService: service, albumContext: albumContext)
        viewModel.viewController = viewController
        viewController.imageListViewModel = viewModel

    }
    
    override func start() {
        
        super.start()
        viewController.imageListCoordinatorDelegate = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension ImageListCoordinator: ImageListCoordinatorDelegate {
    
    func viewDidRemove() {
        
        finish(())
    }
}

