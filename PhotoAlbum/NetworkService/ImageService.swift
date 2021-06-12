//
//  ImageService.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import Foundation
import Alamofire

protocol ImageService {
    
    func getImageListForSpecificAlbum(_ albumId: Int, completionHandler: @escaping (Result<[Photo], Error>) -> ())
}

class ImageServiceClient: ImageService {
    
    /// Get all photo details for a specific album
    /// - Parameters:
    ///   - albumId: album id to be passed
    ///   - completionHandler: completion handler containing success and failure data
    func getImageListForSpecificAlbum(_ albumId: Int, completionHandler: @escaping (Result<[Photo], Error>) -> ()) {
        
        let parameters: [String: Int] = ["albumId": albumId]
        AF.request(Identifiers.photoNetworkURL, parameters: parameters)
            {$0.timeoutInterval = Identifiers.requestTimeoutInterval}.validate()
            .responseDecodable(of: [Photo].self) { (response) in
            
            if let error = response.error {
                
                completionHandler(.failure(error))
            } else {
                
                let photos = response.value ?? []
                completionHandler(.success(photos))
            }
        }
    }
}
