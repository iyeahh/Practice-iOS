//
//  MovieViewController.swift
//  Movie
//
//  Created by Bora Yang on 6/24/24.
//

import UIKit

class MovieViewController: UIViewController {
    private let rootView = MovieRootView()

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
        fetchMovies(id: 1022789)
    }

    private func fetchMovies(id: Int) {
        NetworkManager.shared.fetchMovie(searchWord: .similar, id: id) { movie in
            self.similarMovies = movie.results
        }
        NetworkManager.shared.fetchMovie(searchWord: .recommend, id: id) { movie in
            self.recommendMovies = movie.results
        }
        NetworkManager.shared.fetchPoster(id: id) { poster in
            self.movieBackDrops = poster.backdrops
        }
    }
}
