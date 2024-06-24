//
//  MovieRootView.swift
//  Movie
//
//  Created by Bora Yang on 6/24/24.
//

import UIKit
import SnapKit

class MovieRootView: UIView {
    var similarMovies: [MovieResult] = [] {
        didSet {
            similarMovieCollectionView.reloadData()
        }
    }
    var recommendMovies: [MovieResult] = [] {
        didSet {
            recommendCollectionView.reloadData()
        }
    }

    var movieBackDrops: [Backdrop] = [] {
        didSet {
            posterMovieCollectionView.reloadData()
        }
    }

    private let similarMovieLable = {
        let label = UILabel()
        label.text = "비슷한 영화"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var similarMovieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())

    private let recommendMovieLabel = {
        let label = UILabel()
        label.text = "추천 영화"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var recommendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())

    private let posterLabel = {
        let label = UILabel()
        label.text = "포스터"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var posterMovieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: posterCollectionViewLayout())


    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieRootView {
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.width - 70) / 3
        layout.itemSize = CGSize(width: width, height: width * 1.4)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }

    private func posterCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.width - 70) / 2
        layout.itemSize = CGSize(width: width, height: width * 1.4)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }

    private func configureHierarchy() {
        addSubview(similarMovieLable)
        addSubview(similarMovieCollectionView)
        addSubview(recommendMovieLabel)
        addSubview(recommendCollectionView)
        addSubview(posterLabel)
        addSubview(posterMovieCollectionView)
    }

    private func configureLayout() {
        similarMovieLable.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide).inset(10)
        }

        similarMovieCollectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(similarMovieLable.snp.bottom).offset(5)
            make.height.equalTo(((UIScreen.main.bounds.width - 70) / 3) * 1.4)
        }

        recommendMovieLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalTo(similarMovieCollectionView.snp.bottom).offset(10)
        }

        recommendCollectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(recommendMovieLabel.snp.bottom).offset(10)
            make.height.equalTo(((UIScreen.main.bounds.width - 70) / 3) * 1.4)
        }

        posterLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalTo(recommendCollectionView.snp.bottom).offset(10)
        }

        posterMovieCollectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(posterLabel.snp.bottom).offset(10)
            make.height.equalTo(((UIScreen.main.bounds.width - 70) / 2) * 1.4)
        }
    }
}

extension MovieRootView {
    private func configureCollectionView() {
        similarMovieCollectionView.backgroundColor = .black
        recommendCollectionView.backgroundColor = .black
        posterMovieCollectionView.backgroundColor = .black

        similarMovieCollectionView.delegate = self
        similarMovieCollectionView.dataSource = self

        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self

        posterMovieCollectionView.delegate = self
        posterMovieCollectionView.dataSource = self

        similarMovieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        recommendCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        posterMovieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }
}

extension MovieRootView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == similarMovieCollectionView {
            return similarMovies.count
        } else if collectionView == recommendCollectionView {
            return recommendMovies.count
        } else {
            return movieBackDrops.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }

        if collectionView == similarMovieCollectionView {
            cell.setImageView(urlString: similarMovies[indexPath.item].posterURL)
            return cell
        } else if collectionView == recommendCollectionView {
            cell.setImageView(urlString: recommendMovies[indexPath.item].posterURL)
            return cell
        } else {
            cell.setImageView(urlString: movieBackDrops[indexPath.item].posterURL)
            return cell
        }
    }
}
