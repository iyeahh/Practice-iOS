//
//  SearchViewController.swift
//  Movie
//
//  Created by Bora Yang on 6/24/24.
//

import UIKit

class SearchViewController: UIViewController {
    private let rootView = SearchRootView()

    override func loadView() {
        super.loadView()
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.searchRootViewDelegate = self
        configureUI()
    }

    private func configureUI() {
        navigationItem.title = "영화 정보"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

extension SearchViewController: SearchRootViewDelegate {
    func searchButtonTapped(text: String) {
        NetworkManager.shared.fetchData(api: .search(title: text), model: SearchMovie.self) { data, error in
            guard error == nil else {
                return
            }

            guard let data = data else { return }

            let vc = MovieViewController()
            let movieInfo = data.results[0]

            vc.movieId = movieInfo.id
            vc.movieTitle = movieInfo.original_title
            
            let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
            self.navigationItem.backBarButtonItem = backBarButtonItem

            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
