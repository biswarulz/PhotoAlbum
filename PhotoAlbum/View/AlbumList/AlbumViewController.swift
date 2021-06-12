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
        setupSearchField()
        
        tryGettingAlbumList()
    }
    
    override func loadView() {
        
        view = sceneView
    }
    
    private func setupSearchField() {
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Album"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    private func tryGettingAlbumList() {
        
        sceneView.showSpinner()
        albumListViewModel?.fetchAlbumList()
    }

}

extension AlbumViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let album = albumListDataSource?.cellViewData[indexPath.row]
        let context = AlbumContext(albumId: album?.albumId ?? 0)
        albumListCoordinatorDelegate?.didSelectOnAlbumList(context)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 74.0
    }
}

extension AlbumViewController: AlbumListDisplayLogic {
    
    func displayAlbumList(withTitle titleText: String, data: [AlbumListCellViewData]) {
        
        sceneView.hideSpinner()
        albumListDataSource?.cellViewData = data
        sceneView.tableView.reloadData()
        title = titleText
    }
}

// MARK: - Search Result delegate

extension AlbumViewController: UISearchResultsUpdating {
    
    /// Gets called when typing in the search textfield
    /// - Parameter searchController: search controller
    func updateSearchResults(for searchController: UISearchController) {
        
        if let text = searchController.searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
            
            albumListViewModel?.fetchSearchedAlbumList(forText: text.lowercased())
        }
    }
}


