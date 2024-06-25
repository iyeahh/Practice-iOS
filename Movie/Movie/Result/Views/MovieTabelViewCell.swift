//
//  MovieTabelViewCell.swift
//  Movie
//
//  Created by Bora Yang on 6/25/24.
//

import UIKit
import SnapKit

final class MovieTabelViewCell: UITableViewCell {
    static let identifier = "MovieTabelViewCell"
    var cellCount: CGFloat = 3

    let titleLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    lazy var movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieTabelViewCell {
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.width - 70) / cellCount
        layout.itemSize = CGSize(width: width, height: width * 1.4)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }

    private func configureHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(movieCollectionView)
    }

    private func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)
        }

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
