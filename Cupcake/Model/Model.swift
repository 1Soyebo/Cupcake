//
//  Model.swift
//  Cupcake
//
//  Created by Ibukunoluwa Soyebo on 21/06/2022.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
