//
//  ViewController.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 11/06/21.
//

import UIKit

protocol AlbumListDisplayLogic: AnyObject {
    
    func displayAlbumList(withTitle titleText: String, data: [AlbumListCellViewData])
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
        
        tryGettingAlbumList()
    }
    
    override func loadView() {
        
        view = sceneView
    }
    
    private func tryGettingAlbumList() {
        
        albumListViewModel?.fetchAlbumList()
    }

}

extension AlbumViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 74.0
    }
}

extension AlbumViewController: AlbumListDisplayLogic {
    
    func displayAlbumList(withTitle titleText: String, data: [AlbumListCellViewData]) {
        
        albumListDataSource?.cellViewData = data
        sceneView.tableView.reloadData()
        title = titleText
    }
}

