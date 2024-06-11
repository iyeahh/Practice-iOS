//
//  NetworkManager.swift
//  SearchMovie
//
//  Created by Bora Yang on 6/11/24.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()

    var dataHandler: (([MoviePosterDTO]) -> Void)?

    private init() {}

    func callRequest(searchWord: String, page: Int) {
        let url = URLString.movie + searchWord + "&page=\(page)"

        let header: HTTPHeaders = [
            "Authorization": APIKey.movie,
            "accept": "application/json"
        ]

        AF.request(url,
                   headers: header)
        .responseDecodable(of: MovieDTO.self) { response in
            switch response.result {
            case .success(let movie):
                if page > movie.total_pages {
                    return
                }
                guard let moviePoster = movie.results else { return }
                self.dataHandler?(moviePoster)
            case .failure(let error):
                print(error)
            }
        }
    }
}
