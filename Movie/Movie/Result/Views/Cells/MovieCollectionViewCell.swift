//
//  MovieCollectionViewCell.swift
//  Movie
//
//  Created by Bora Yang on 6/24/24.
//

import UIKit
import SnapKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCollectionViewCell"

    private let movieImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieCollectionViewCell {
    private func configureHierarchy() {
        contentView.addSubview(movieImageView)
    }

    private func configureLayout() {
        movieImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MovieCollectionViewCell {
    func setImageView(urlString: String) {
        let url = URL(string: urlString)
        movieImageView.kf.setImage(with: url)
    }
}
