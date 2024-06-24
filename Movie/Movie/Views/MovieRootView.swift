//
//  MovieRootView.swift
//  Movie
//
//  Created by Bora Yang on 6/24/24.
//

import UIKit
import SnapKit

class MovieRootView: UIView {
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
        layout.itemSize = CGSize(width: width, height: width * 1.3)
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
    }

    private func configureLayout() {
        similarMovieLable.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide).inset(10)
        }

        similarMovieCollectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(similarMovieLable.snp.bottom)
        }

        recommendMovieLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalTo(similarMovieCollectionView.snp.bottom).offset(10)
        }

        recommendCollectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(recommendMovieLabel.snp.bottom)
        }
    }
}

extension MovieRootView: UICollectionViewDelegate, UICollectionViewDataSource {
    private func configureCollectionView() {
        similarMovieCollectionView.delegate = self
        similarMovieCollectionView.dataSource = self

        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self

        similarMovieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        recommendCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == similarMovieCollectionView {
            return 5
        } else {
            return 10
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == similarMovieCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.movieImageView.image = UIImage(systemName: "star.fill")
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.movieImageView.image = UIImage(systemName: "heart.fill")
            return cell
        }
    }
}
