//
//  ViewController.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 11/06/21.
//

import UIKit

protocol AlbumListDisplayLogic: AnyObject {
    
    func displayAlbumList()
}

protocol AlbumListCoordinatorDelegate: AnyObject {
    
    func didSelectOnAlbumList(_ context: AlbumContext)
}

class AlbumViewController: UIViewController {

    lazy var sceneView: AlbumListView = {
        
        AlbumListView()
    }()
    
    var albumListViewModel: AlbumListBusinessLogic?
    let albumListDataSource: AlbumListDataSource?
    weak var albumListCoordinatorDelegate: AlbumListCoordinatorDelegate?
    
    init(albumListDataSource: AlbumListDataSource) {
        
        self.albumListDataSource = albumListDataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.tableView.dataSource = albumListDataSource
        sceneView.tableView.delegate = self
    }
    
    override func loadView() {
        
        view = sceneView
    }

}

extension AlbumViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

