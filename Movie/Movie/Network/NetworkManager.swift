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

    func fetchData<T: Decodable>(
        api: TMDBManager,
        model: T.Type,
        completionHandler: @escaping (T?, NetworkError?) -> Void
    ) {
        guard let url = api.url else { return }

        var request = URLRequest(url: url)
        request.setValue(APIKey.movieAPIKey, forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    completionHandler(nil, .failedRequest)
                    return
                }

                guard let data = data else {
                    completionHandler(nil, .noData)
                    return
                }

                guard let response = response as? HTTPURLResponse else {
                    completionHandler(nil, .invalidResponse)
                    return
                }

                guard response.statusCode == 200 else {
                    completionHandler(nil, .failedRequest)
                    return
                }

                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(result, nil)
                } catch {
                    completionHandler(nil, .invalidData)
                }
            }
        }.resume()
    }

    func fetchVideo(id: Int, completionHandler: @escaping (Video?, String?) -> Void ) {
        guard let url = TMDBManager.video(id: id).url else { return }

        AF.request(url, headers: TMDBManager.video(id: id).header)
            .responseDecodable(of: Video.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value, nil)
                case .failure(let error):
                    completionHandler(nil, "잠시 후 다시 시도해주세요.")
                    print(error)
                }
            }
    }
}
