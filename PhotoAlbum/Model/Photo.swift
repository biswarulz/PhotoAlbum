//
//  Photo.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import Foundation

struct Photo: Decodable {
    
    let albumId: Int
    let photoId: Int
    let title: String
    let url: String
    let thumbnailUrl: String

    enum CodingKeys: String, CodingKey {
        
        case albumId, title, url, thumbnailUrl
        case photoId = "id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        albumId = try container.decodeIfPresent(Int.self, forKey: .albumId) ?? 0
        photoId = try container.decodeIfPresent(Int.self, forKey: .photoId) ?? 0
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        thumbnailUrl = try container.decodeIfPresent(String.self, forKey: .thumbnailUrl) ?? ""
    }
    
    init(albumId: Int = 0, photoId: Int = 0, title: String = "", url: String = "", thumbnailUrl: String = "") {
        
        self.albumId = albumId
        self.photoId = photoId
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
}

struct ImageListCellViewData {
    
    let title: String
    let imageUrl: String
    let thumbnailUrl: String
}
