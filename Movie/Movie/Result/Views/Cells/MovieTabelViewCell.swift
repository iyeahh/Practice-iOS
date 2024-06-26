//
//  MovieTabelViewCell.swift
//  Movie
//
//  Created by Bora Yang on 6/25/24.
//

import UIKit
import SnapKit

final class MovieTabelViewCell: BaseTableViewCell {
    static let identifier = "MovieTabelViewCell"
    var cellCount: CGFloat = 3

    lazy var movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())

    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.width - 70) / cellCount
        layout.itemSize = CGSize(width: width, height: width * 1.4)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }

    override func configureHierarchy() {
        super.configureHierarchy()
        contentView.addSubview(movieCollectionView)
    }

    override func configureLayout() {
        super.configureLayout()
        movieCollectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.height.equalTo(((UIScreen.main.bounds.width - 70) / cellCount) * 1.4)
        }
    }

    private func configureView() {
        contentView.backgroundColor = .black
    }

    func setTitleLabel(index: Int) {
        if index == 0 {
            titleLabel.text = "비슷한 영화"
        } else if index == 1 {
            titleLabel.text = "추천 영화"
        } else {
            titleLabel.text = "포스터"
        }
        movieCollectionView.backgroundColor = .black
    }
}
