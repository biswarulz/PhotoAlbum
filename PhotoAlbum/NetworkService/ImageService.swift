//
//  ImageService.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import Foundation
import Combine

protocol ImageService {
    
    func getImageList(url: URL) -> AnyPublisher<[Photo], Error>
}

class ImageServiceClient: ImageService {
    
    func getImageList(url: URL) -> AnyPublisher<[Photo], Error> {
        
        URLSession.shared.dataTaskPublisher(for: url)
            .compactMap { $0.data }
            .decode(type: [Photo].self, decoder: JSONDecoder())
            .mapError{ $0 as Error }
            .eraseToAnyPublisher()
    }
}
