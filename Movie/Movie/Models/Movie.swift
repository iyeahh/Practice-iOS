//
//  Movie.swift
//  Movie
//
//  Created by Bora Yang on 6/24/24.
//

import Foundation

struct Movie: Decodable {
    let results: [MovieResult]

    enum CodingKeys: CodingKey {
        case results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decodeIfPresent([MovieResult].self, forKey: .results) ?? []
    }
}

struct MovieResult: Decodable {
    let poster_path: String

    enum CodingKeys: CodingKey {
        case poster_path
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.poster_path = try container.decodeIfPresent(String.self, forKey: .poster_path) ?? "https://image.tmdb.org/t/p/w780/zREAzThdoALNhci72PuN3bH22BZ.jpg"
    }

    var posterURL: String {
        "https://image.tmdb.org/t/p/w780" + poster_path
    }
}
