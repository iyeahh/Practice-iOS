//
//  MovieTableViewCell.swift
//  MediaProject
//
//  Created by Bora Yang on 6/5/24.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"

    var rankingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()

    var movieTitleLable: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()

    var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierachy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureHierachy() {
        contentView.addSubview(rankingLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(movieTitleLable)
    }

    private func configureLayout() {
        rankingLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.equalToSuperview()
            make.width.equalTo(30)
        }

        dateLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalTo(contentView.snp.top).offset(5)
            make.height.equalTo(30)
            make.width.equalTo(80)
        }

        movieTitleLable.snp.makeConstraints { make in
            make.leading.equalTo(rankingLabel.snp.trailing).offset(20)
            make.top.equalTo(contentView.snp.top).offset(5)
            make.height.equalTo(40)
            make.trailing.equalTo(dateLabel.snp.leading).inset(5)
        }
    }

    private func configureUI() {
        contentView.backgroundColor = .black
    }
}
