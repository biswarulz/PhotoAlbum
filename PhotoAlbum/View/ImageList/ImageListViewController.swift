//
//  ImageListViewController.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import UIKit

protocol ImageListCoordinatorDelegate: AnyObject {
    
    func viewDidRemove()
}

protocol ImageListDisplayLogic: AnyObject {
    
    func displayImageList(forTitle titleText: String, viewData: [ImageListCellViewData])
    func displayServerError()
}

class ImageListViewController: UIViewController {

    lazy var sceneView: ImageListView = {
        
        ImageListView()
    }()
    
    var imageListViewModel: ImageListBusinessLogic?
    let imageListDataSource: ImageListDataSource?
    weak var imageListCoordinatorDelegate: ImageListCoordinatorDelegate?
    
    /// constant values used
    private struct ViewTraits {
        
        static let numberOfCellInARow: CGFloat = 2.4
        static let horizontalSpacingBetweenCell: CGFloat = 2 * 2
    }
    
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
        sceneView.imageListCollectionView.dataSource = imageListDataSource
        sceneView.imageListCollectionView.delegate = self
        
        tryFetchingImageList()
    }
    
    override func loadView() {
        
        view = sceneView
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        imageListCoordinatorDelegate?.viewDidRemove()
    }
    
    private func tryFetchingImageList() {
        
        sceneView.showSpinner()
        imageListViewModel?.fetchImageList()
    }

}

extension ImageListViewController: ImageListDisplayLogic {
    
    func displayImageList(forTitle titleText: String, viewData: [ImageListCellViewData]) {
        
        sceneView.hideSpinner()
        imageListDataSource?.cellViewData = viewData
        title = titleText
        sceneView.imageListCollectionView.reloadData()
    }
    
    /// Displays server error
    func displayServerError() {
        
        sceneView.hideSpinner()
        let alert = UIAlertController(title: Identifiers.errorTitle, message: Identifiers.errorDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Identifiers.okTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ImageListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: sceneView.imageListCollectionView.frame.size.width, height: sceneView.imageListCollectionView.frame.size.height / CGFloat(ViewTraits.numberOfCellInARow))
    }
}
