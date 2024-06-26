//
//  SearchMovie.swift
//  Movie
//
//  Created by Bora Yang on 6/24/24.
//

import Foundation

struct SearchMovie: Decodable {
    let results: [MovieInfo]
}

struct MovieInfo: Decodable {
    let id: Int
    let original_title: String
}
