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
        setUpNavigationBar()
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
    
    private func setUpNavigationBar() {
        self.navigationController.navigationBar.prefersLargeTitles = true
        self.navigationController.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
             NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)]
        self.navigationController.navigationBar.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
    }
}

extension AlbumListCoordinator: AlbumListCoordinatorDelegate {
    
    func didSelectOnAlbumList(_ context: AlbumContext) {
        
    }
}
