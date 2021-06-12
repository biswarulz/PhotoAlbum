//
//  AlbumService.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import Foundation
import Combine

protocol AlbumService {
    
    func getAlbumList(url: URL) -> AnyPublisher<[Album], Error>
}

class AlbumServiceClient: AlbumService {
    
    func getAlbumList(url: URL) -> AnyPublisher<[Album], Error> {
        
        URLSession.shared.dataTaskPublisher(for: url)
            .compactMap { $0.data }
            .decode(type: [Album].self, decoder: JSONDecoder())
            .mapError{ $0 as Error }
            .eraseToAnyPublisher()
    }
}
