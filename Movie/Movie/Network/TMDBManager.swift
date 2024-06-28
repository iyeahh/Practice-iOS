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

    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.themoviedb.org"
    }

    var path: String {
        switch self {
        case .search:
            return "/3/search/movie"
        case .similar(let id):
            return "/3/movie/\(id)/similar"
        case .recommend(let id):
            return "/3/movie/\(id)/recommendations"
        case .poster(let id):
            return "/3/movie/\(id)/images"
        }
    }

    var queryItem: [URLQueryItem] {
        switch self {
        case .search(let title):
            let titleValue = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return [
                URLQueryItem(name: "query", value: titleValue),
                URLQueryItem(name: "language", value: "ko-KR")
            ]
        case .similar, .recommend:
            return [
                URLQueryItem(name: "language", value: "ko-KR")
            ]
        case.poster:
            return []
        }
    }

    var url: URL? {
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        component.queryItems = queryItem
        return component.url
    }
}
