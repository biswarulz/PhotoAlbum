//
//  ImageListViewController.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import UIKit

protocol ImageListCoordinatorDelegate: AnyObject {
    
    
}

protocol ImageListDisplayLogic: AnyObject {
    
}

class ImageListViewController: UIViewController {

    lazy var sceneView: ImageListView = {
        
        ImageListView()
    }()
    
    var imageListViewModel: ImageListBusinessLogic?
    let imageListDataSource: ImageListDataSource?
    weak var imageListCoordinatorDelegate: ImageListCoordinatorDelegate?
    
    init(imageListDataSource: ImageListDataSource) {
        
        self.imageListDataSource = imageListDataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ImageListViewController: ImageListDisplayLogic {
    
}
