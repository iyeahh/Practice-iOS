//
//  MovieDTO.swift
//  SearchMovie
//
//  Created by Bora Yang on 6/11/24.
//

import Foundation

struct MovieDTO: Decodable {
    let page: Int
    let results: [MoviePosterDTO]?
    let total_pages: Int
    let total_results: Int
}

struct MoviePosterDTO: Decodable {
    let poster_path: String?

    var url: URL {
        let imageString = "https://image.tmdb.org/t/p/w780" + (poster_path ?? "/pUd1FYQb5r55RqXpx08dnCbP1fs.jpg")
        let url = URL(string: imageString)!
        return url
    }
}

