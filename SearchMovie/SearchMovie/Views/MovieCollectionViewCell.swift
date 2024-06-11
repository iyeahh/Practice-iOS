//
//  MovieCollectionViewCell.swift
//  SearchMovie
//
//  Created by Bora Yang on 6/11/24.
//

import UIKit
import SnapKit

class MovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCollectionViewCell"

    let posterImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHeierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHeierarchy() {
        contentView.addSubview(posterImageView)
    }

    private func configureLayout() {
        posterImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
