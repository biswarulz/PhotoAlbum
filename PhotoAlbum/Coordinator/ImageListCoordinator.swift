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
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
        viewController = ImageListViewController(imageListDataSource: ImageListDataSource(cellViewData: []))

        super.init()
        setUp()
    }
    
    private func setUp() {
        
        let service: ImageService = ImageServiceClient()
        let viewModel = ImageListViewModel(imageService: service)
        viewModel.viewController = viewController
        viewController.imageListViewModel = viewModel
    }
}

extension ImageListCoordinator: ImageListCoordinatorDelegate {
    
}

