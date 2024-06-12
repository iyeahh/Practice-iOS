//
//  MovieContentTableViewCell.swift
//  MediaProject
//
//  Created by Bora Yang on 6/10/24.
//

import UIKit
import SnapKit
import Kingfisher

class MovieContentTableViewCell: UITableViewCell {
    var callBackMehtod: (() -> Void)?

    let dateLabel = {
        let label = UILabel()
        label.text = "12/10/2020"
        label.font = .systemFont(ofSize: 10)
        return label
    }()

    let categoryLabel = {
        let label = UILabel()
        label.text = "#Mystery"
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()

    let shadowView = {
        let view = UIView()
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.8
        view.layer.shadowRadius = 5
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()

    let posterImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "star")
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return imageView
    }()

    let rateBackgroundLabel = {
        let label = UILabel()
        label.text = "평점"
        label.backgroundColor = .purple
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()

    let rateLabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "3.3"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 10)
        return label
    }()

    let infoBackView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()

    let titleLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "Alice in Borderland"
        return label
    }()

    let castingLabel = {
        let label = UILabel()
        label.text = "DDDDddddddgdgdgdgdgdgdgdgdgdgdgdgdgdgdgdgdgdgdd"
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    let barView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    let showMoreLabel = {
        let label = UILabel()
        label.text = "자세히 보기"
        label.font = .systemFont(ofSize: 10)
        return label
    }()

    let showMoreImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let showMoreButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.addTarget(nil, action: #selector(showMoreButtonTapped), for: .touchUpInside)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHeierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureHeierarchy() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(shadowView)
        contentView.addSubview(posterImageView)
        contentView.addSubview(rateBackgroundLabel)
        contentView.addSubview(rateLabel)
        contentView.addSubview(infoBackView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(castingLabel)
        contentView.addSubview(barView)
        contentView.addSubview(showMoreLabel)
        contentView.addSubview(showMoreImageView)
        contentView.addSubview(showMoreButton)
    }

    private func configureLayout() {
        dateLabel.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(contentView).inset(20)
            make.height.equalTo(15)
        }

        categoryLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.top.equalTo(dateLabel.snp.bottom)
            make.height.equalTo(20)
        }

        shadowView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(contentView).inset(20)
            make.top.equalTo(categoryLabel.snp.bottom).offset(5)
        }

        posterImageView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(shadowView)
            make.height.equalTo(shadowView.snp.height).multipliedBy(0.65)
        }

        rateBackgroundLabel.snp.makeConstraints { make in
            make.leading.bottom.equalTo(posterImageView).inset(10)
            make.height.equalTo(20)
            make.width.equalTo(30)
        }

        rateLabel.snp.makeConstraints { make in
            make.width.height.bottom.equalTo(rateBackgroundLabel)
            make.leading.equalTo(rateBackgroundLabel.snp.trailing)
        }

        infoBackView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(shadowView)
            make.height.equalTo(shadowView.snp.height).multipliedBy(0.35)
        }

        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(infoBackView).inset(20)
            make.height.equalTo(30)
        }

        castingLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(infoBackView).inset(20)
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(20)
        }

        barView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(infoBackView).inset(20)
            make.top.equalTo(castingLabel.snp.bottom).offset(20)
            make.height.equalTo(1)
        }

        showMoreLabel.snp.makeConstraints { make in
            make.leading.bottom.equalTo(infoBackView).inset(20)
            make.height.equalTo(20)
            make.width.equalTo(70)
        }

        showMoreImageView.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(infoBackView).inset(20)
            make.top.equalTo(barView.snp.bottom).offset(20)
            make.width.equalTo(showMoreImageView.snp.height)
        }

        showMoreButton.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(infoBackView).inset(20)
            make.top.equalTo(barView.snp.bottom).offset(10)
        }
    }

    @objc func showMoreButtonTapped() {
        callBackMehtod?()
    }

    func configureData(_ movie: Movies) {
        dateLabel.text = movie.dateString
        categoryLabel.text = movie.genreString
        posterImageView.kf.setImage(with: movie.imageUrl)
        rateLabel.text = movie.rateString
        titleLabel.text = movie.title
        castingLabel.text = movie.actorsString
    }
}
