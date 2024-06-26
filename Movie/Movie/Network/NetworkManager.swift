//
//  NetworkManager.swift
//  Movie
//
//  Created by Bora Yang on 6/24/24.
//

import UIKit
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()

    private init() { }

    func fetchMovie(
        api: TMDBManager,
        completionHandler: @escaping (Movie?, String?) -> Void
    ) {
        AF.request(api.endPoint,
                   parameters: api.parmeter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header)
        .responseDecodable(of: Movie.self) { response in
            switch response.result {
            case .success(let value):
                completionHandler(value, nil)
            case .failure:
                completionHandler(nil, "잠시 후 다시 시도해주세요")
            }
        }
    }

    func fetchMoviePoster(
        api: TMDBManager,
        completionHandler: @escaping (Poster?, String?) -> Void
    ) {
        AF.request(api.endPoint,
                   parameters: api.parmeter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header)
        .responseDecodable(of: Poster.self) { response in
            switch response.result {
            case .success(let value):
                completionHandler(value, nil)
            case .failure:
                completionHandler(nil, "잠시 후 다시 시도해주세요")
            }
        }
    }

    func fetchSearchMovie(
        api: TMDBManager,
        completionHandler: @escaping (SearchMovie?, String?) -> Void
    ) {
        AF.request(api.endPoint,
                   parameters: api.parmeter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header)
        .responseDecodable(of: SearchMovie.self) { response in
            switch response.result {
            case .success(let value):
                completionHandler(value, nil)
            case .failure:
                completionHandler(nil, "잠시 후 다시 시도해주세요")
            }
        }
    }
}
