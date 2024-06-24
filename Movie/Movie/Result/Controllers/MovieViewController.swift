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

    var similarMovies: [MovieResult] = [] {
        didSet {
            rootView.similarMovies = similarMovies
        }
    }
    var recommendMovies: [MovieResult] = [] {
        didSet {
            rootView.recommendMovies = recommendMovies
        }
    }

    var movieBackDrops: [Backdrop] = [] {
        didSet {
            rootView.movieBackDrops = movieBackDrops
        }
    }


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
        NetworkManager.shared.fetchMovie(searchWord: .similar, id: id) { (movie: Movie) -> Void in
            self.similarMovies = movie.results
        }

        NetworkManager.shared.fetchMovie(searchWord: .recommend, id: id) { (movie: Movie) -> Void in
            self.recommendMovies = movie.results
        }

        NetworkManager.shared.fetchMovie(searchWord: .poster, id: id) { (poster: Poster) -> Void in
            self.movieBackDrops = poster.backdrops
        }
    }
}
