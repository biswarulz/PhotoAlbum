//
//  ViewController.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 11/06/21.
//

import UIKit

class AlbumViewController: UIViewController {

    lazy var sceneView: AlbumListView = {
        
        AlbumListView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        
        view = sceneView
    }

}

