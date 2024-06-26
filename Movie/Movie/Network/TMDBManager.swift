//
//  TMDBManager.swift
//  Movie
//
//  Created by Bora Yang on 6/26/24.
//

import Foundation
import Alamofire

enum TMDBManager {
    case search(title: String)
    case similar(id: Int)
    case recommend(id: Int)
    case poster(id: Int)

    var baseURL: String {
        return "https://api.themoviedb.org/3/"
    }

    var endPoint: URL {
        switch self {
        case .search:
            return URL(string: baseURL + "search/movie")!
        case .similar(let id):
            return URL(string: baseURL + "movie/\(id)/similar")!
        case .recommend(let id):
            return URL(string: baseURL + "movie/\(id)/recommendations")!
        case .poster(let id):
            return URL(string: baseURL + "movie/\(id)/images")!
        }
    }

    var header: HTTPHeaders {
        return [
        "Authorization": APIKey.movieAPIKey,
        "accept": "application/json"
        ]
    }

    var parmeter: Parameters {
        switch self {
        case .search(let title):
            return ["query": title, "language": "ko-KR"]
        case .similar, .recommend:
            return ["language": "ko-KR"]
        case.poster:
            return ["": ""]
        }
    }
}
