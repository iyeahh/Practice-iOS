//
//  Poster.swift
//  Movie
//
//  Created by Bora Yang on 6/24/24.
//

import Foundation

struct Poster: Decodable {
    let backdrops: [Backdrop]
}

struct Backdrop: Decodable {
    let file_path: String

    var posterURL: String {
        "https://image.tmdb.org/t/p/w780" + file_path
    }
}
