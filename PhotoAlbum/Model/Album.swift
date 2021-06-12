//
//  Album.swift
//  PhotoAlbum
//
//  Created by Biswajyoti Sahu on 12/06/21.
//

import Foundation

struct Album: Decodable {
    
    let userId: Int
    let albumId: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        
        case userId, title
        case albumId = "id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        userId = try container.decodeIfPresent(Int.self, forKey: .userId) ?? 0
        albumId = try container.decodeIfPresent(Int.self, forKey: .albumId) ?? 0
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
    }
}

struct AlbumContext {
    
    let albumId: Int
}

struct AlbumListCellViewData {
    
    let albumId: Int
    let title: String
    let serialNo: String
}

