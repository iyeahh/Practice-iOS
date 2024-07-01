//
//  Video.swift
//  Movie
//
//  Created by Bora Yang on 7/1/24.
//

import Foundation

struct Video: Decodable {
    let id: Int
    let results: [VideoResult]
}

struct VideoResult: Decodable {
    let name: String
    let key: String

    var youtubeURL: String {
        return "https://www.youtube.com/watch?v=" + key
    }
}
