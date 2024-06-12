//
//  CastingTableViewCell.swift
//  MediaProject
//
//  Created by Bora Yang on 6/12/24.
//

import UIKit
import SnapKit
import Kingfisher

class CastingTableViewCell: UITableViewCell {
    let actorImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    let actorNameLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()

    let charactorNameLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.textColor = .gray
        return label
    }()

    lazy var nameStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.addArrangedSubview(actorNameLabel)
        stackView.addArrangedSubview(charactorNameLabel)
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureHierarchy(){
        contentView.addSubview(actorImageView)
        contentView.addSubview(nameStackView)
    }

    private func configureLayout() {
        actorImageView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView).inset(10)
            make.leading.equalTo(contentView).inset(20)
            make.width.equalTo(actorImageView.snp.height).multipliedBy(0.8)
        }

        nameStackView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(actorImageView.snp.trailing).offset(20)
            make.trailing.equalTo(contentView).inset(20)
            make.height.equalTo(30)
        }
    }

    func setData(_ data: PlayActor) {
        actorNameLabel.text = data.name
        charactorNameLabel.text = "\(data.character!)"
        let urlString = data.profile_path ?? "/qYNofOjlRke2MlJVihmJmEdQI4v.jpg"
        let url = URL(string: "https://image.tmdb.org/t/p/w780" + urlString)
        actorImageView.kf.setImage(with: url)
    }
}
