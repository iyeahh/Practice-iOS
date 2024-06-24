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

    func fetchMovie<T: Decodable>(searchWord: SearchWord, id: Int, completionHandler: @escaping (T) -> Void) {

        let header: HTTPHeaders = [
            "Authorization": APIKey.movieAPIKey,
            "accept": "application/json"
        ]

        let url = makeURL(searchWord: searchWord, id: id)

        AF.request(url,
                   headers: header)
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                print(error)
            }
        }
    }

    func searchMovie(text: String, completionHandler: @escaping (SearchMovie) -> Void) {
        let header: HTTPHeaders = [
            "Authorization": APIKey.movieAPIKey,
            "accept": "application/json"
        ]

        let url = URLString.searchMovie(query: text)

        AF.request(url,
                   headers: header)
        .responseDecodable(of: SearchMovie.self) { response in
            switch response.result {
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                print(error)
            }
        }
    }

    private func makeURL(searchWord: SearchWord, id: Int) -> String {
        if searchWord == .similar {
            return URLString.similarMovie(id: id)
        } else if searchWord == .recommend {
            return URLString.recommendMovie(id: id)
        } else {
            return URLString.posterMovie(id: id)
        }
    }
}
