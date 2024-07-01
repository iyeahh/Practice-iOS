//
//  MovieViewController.swift
//  Movie
//
//  Created by Bora Yang on 6/24/24.
//

import UIKit

class MovieViewController: UIViewController {
    private let rootView = MovieRootView()
    var movieTitle = ""
    var movieId = 0

    var imageList: [[String]] = [
        [],
        [],
        []
    ]

    override func loadView() {
        super.loadView()
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies(id: movieId)
        configureUI()
    }
}

extension MovieViewController {
    private func configureUI() {
        navigationItem.title = movieTitle
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true

        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = barButtonItem
    }

    private func fetchMovies(id: Int) {
        let group = DispatchGroup()

        group.enter()
        NetworkManager.shared.fetchData(api: .similar(id: id), model: Movie.self) { data, error in
            guard error == nil else { return }
            guard let data = data else { return }
            let array = data.results.map { movieResult in
                movieResult.posterURL
            }
            self.imageList[0] = array
            group.leave()
        }

        group.enter()
        NetworkManager.shared.fetchData(api: .recommend(id: id), model: Movie.self) { data, error in
            guard error == nil else { return }
            guard let data = data else { return }
            let array = data.results.map { movieResult in
                movieResult.posterURL
            }
            self.imageList[1] = array
            group.leave()
        }

        group.enter()
        NetworkManager.shared.fetchData(api: .poster(id: id), model: Poster.self) { data, error in
            guard error == nil else { return }
            guard let data = data else { return }
            let array = data.backdrops.map { backDrop in
                backDrop.posterURL
            }
            self.imageList[2] = array
            group.leave()
        }

        group.enter()
        NetworkManager.shared.fetchVideo(id: id) { success, error  in
            if let error = error {
                print(error) // 얼럿으로 사용자에게 표시
            } else {
                guard let data = success else { return }
                self.rootView.url = data.results[0].youtubeURL
            }
            group.leave()
        }

        group.notify(queue: .main) {
            self.rootView.imageList = self.imageList
            self.rootView.movieTableView.reloadData()
        }
    }
}
