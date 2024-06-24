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

    override func loadView() {
        super.loadView()
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchMovie(searchWord: .similar, id: 1022789) { movie in
            self.similarMovies = movie.results
        }
        NetworkManager.shared.fetchMovie(searchWord: .recommend, id: 1022789) { movie in
            self.recommendMovies = movie.results
        }
    }
}
