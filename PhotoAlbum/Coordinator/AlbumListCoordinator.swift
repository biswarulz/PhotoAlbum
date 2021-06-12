//
//  AlbumListCoordinator.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import UIKit

class AlbumListCoordinator: Coordinator<Void> {
    
    private var navigationController: UINavigationController
    private var viewController: AlbumViewController
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
        viewController = AlbumViewController(albumListDataSource: AlbumListDataSource(cellViewData: []))

        super.init()
        setUp()
    }
    
    private func setUp() {
        
        let service: AlbumService = AlbumServiceClient()
        let viewModel = AlbumListViewModel(albumService: service)
        viewModel.viewController = viewController
        viewController.albumListViewModel = viewModel
    }
    
    override func start() {
        super.start()
        
        viewController.albumListCoordinatorDelegate = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension AlbumListCoordinator: AlbumListCoordinatorDelegate {
    
    func didSelectOnAlbumList(_ context: AlbumContext) {
        
    }
}
