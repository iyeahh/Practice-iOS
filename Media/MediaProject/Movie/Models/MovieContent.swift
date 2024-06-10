//
//  MovieContent.swift
//  MediaProject
//
//  Created by Bora Yang on 6/10/24.
//

import Foundation

struct MovieContent: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let overview: String
    let poster_path: String
    let title: String
    let release_date: String
    let genre_ids: [Int]
    let vote_average: Double

    var genre: [String] {
        var genreArray: [String] = []
        genreArray = genre_ids.map { id in
            MovieGenre(rawValue: id)!.genre
        }
        return genreArray
    }
}
