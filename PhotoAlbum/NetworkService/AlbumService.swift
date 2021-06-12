//
//  AlbumService.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import Foundation

protocol AlbumService {
    
    func getAlbumList(_ completionHandler: @escaping (Result<[Album], Error>) -> ())
}

class AlbumServiceClient: AlbumService {
    
    func getAlbumList(_ completionHandler: @escaping (Result<[Album], Error>) -> ()) {
        
    }
    
}
