//
//  AlbumService.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import Foundation
import Alamofire

protocol AlbumService {
    
    func getAlbumList(_ completionHandler: @escaping (Result<[Album], Error>) -> ())
}

class AlbumServiceClient: AlbumService {
    
    func getAlbumList(_ completionHandler: @escaping (Result<[Album], Error>) -> ()) {
        
        AF.request(Identifiers.albumNetworkURL)
            {$0.timeoutInterval = Identifiers.requestTimeoutInterval}.validate()
            .responseDecodable(of: [Album].self) { (response) in
            
            if let error = response.error {
                
                completionHandler(.failure(error))
            } else {
                
                let albums = response.value ?? []
                completionHandler(.success(albums))
            }
        }
    }
}
