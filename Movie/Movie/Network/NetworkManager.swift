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

    func fetchMovie(searchWord: SearchWord, id: Int, completionHandler: @escaping (Movie) -> Void) {

        let header: HTTPHeaders = [
            "Authorization": APIKey.movieAPIKey,
            "accept": "application/json"
        ]

        let url = makeURL(searchWord: searchWord, id: id)

        AF.request(url,
                   headers: header)
        .responseDecodable(of: Movie.self) { response in
            switch response.result {
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                print(error)
            }
        }
    }

    private func makeURL(searchWord: SearchWord, id: Int) -> String {
        return searchWord == .similar ? URLString.similarMovie(id: id) : URLString.recommendMovie(id: id)    }
}
