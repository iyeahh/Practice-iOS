//
//  SearchMoviewViewController.swift
//  SearchMovie
//
//  Created by Bora Yang on 6/11/24.
//

import UIKit
import SnapKit
import Kingfisher

class SearchMoviewViewController: UIViewController {
    let networkManager = NetworkManager.shared

    var page = 1

    var movieList: [MoviePosterDTO] = [] {
        didSet {
            movieCollectionView.reloadData()
            if self.page == 1 {
                self.movieCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
        }
    }

    let searchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "영화 제목을 검색해보세요."
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()

    lazy var movieCollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureHeierarchy()
        configureLayout()
        configureCollectionView()
        configureSearchBar()
        setMovieList()
    }

    private func setMovieList() {
        networkManager.dataHandler = { movies in
            if self.page == 1 {
                self.movieList = movies
            } else {
                self.movieList.append(contentsOf: movies)
            }
        }
    }

    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.width - 40) / 3
        let height = width * 1.3
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
        return layout
    }

    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "영화 검색"
    }

    private func configureHeierarchy() {
        view.addSubview(searchBar)
        view.addSubview(movieCollectionView)
    }

    private func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }

        movieCollectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom)
        }
    }

    private func configureCollectionView() {
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.prefetchDataSource = self
        movieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }

    private func configureSearchBar() {
        searchBar.delegate = self
    }
}

extension SearchMoviewViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        let data = movieList[indexPath.item]
        cell.posterImageView.kf.setImage(with: data.url)
        return cell
    }
}

extension SearchMoviewViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for item in indexPaths {
            if movieList.count - 2 == item.item {
                page += 1
                networkManager.callRequest(searchWord: searchBar.text!, page: page)
            }
        }
    }
}

extension SearchMoviewViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        networkManager.callRequest(searchWord: searchBar.text!, page: page)
        searchBar.resignFirstResponder()
    }
}
