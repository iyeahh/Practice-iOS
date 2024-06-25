//
//  MovieRootView.swift
//  Movie
//
//  Created by Bora Yang on 6/24/24.
//

import UIKit
import SnapKit

class MovieRootView: UIView {
    var imageList: [[String]] = [
        [],
        [],
        []
    ]

    let movieTableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureView()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieRootView {
    private func configureHierarchy() {
        addSubview(movieTableView)
    }

    private func configureLayout() {
        movieTableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }

    private func configureView() {
        backgroundColor = .black
        movieTableView.backgroundColor = .black
    }
}

extension MovieRootView {
    private func configureTableView() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(MovieTabelViewCell.self, forCellReuseIdentifier: MovieTabelViewCell.identifier)
        movieTableView.register(PosterTableViewCell.self, forCellReuseIdentifier: PosterTableViewCell.identifier)
    }
}

extension MovieRootView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 || indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTabelViewCell.identifier, for: indexPath) as? MovieTabelViewCell else {
                return UITableViewCell()
            }
            cell.movieCollectionView.delegate = self
            cell.movieCollectionView.dataSource = self
            cell.movieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)

            cell.movieCollectionView.tag = indexPath.row
            cell.setTitleLabel(index: indexPath.row)
            cell.movieCollectionView.reloadData()
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.identifier, for: indexPath) as? PosterTableViewCell else {
                return UITableViewCell()
            }
            cell.movieCollectionView.delegate = self
            cell.movieCollectionView.dataSource = self
            cell.movieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)

            cell.movieCollectionView.tag = indexPath.row
            cell.setTitleLabel(index: indexPath.row)
            cell.movieCollectionView.reloadData()
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension MovieRootView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList[collectionView.tag].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.setImageView(urlString: imageList[collectionView.tag][indexPath.item])
        return cell
    }
}
