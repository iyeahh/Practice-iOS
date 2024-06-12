//
//  WeatherTableViewCell.swift
//  MediaProject
//
//  Created by Bora Yang on 6/8/24.
//

import UIKit
import SnapKit

class WeatherTableViewCell: UITableViewCell {
    
    let labelBackgroundView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()

    let descriptionLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureHeierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        backgroundColor = .clear
    }

    private func configureHeierarchy() {
        contentView.addSubview(labelBackgroundView)
        contentView.addSubview(descriptionLabel)
    }

    private func configureLayout() {
        descriptionLabel.snp.makeConstraints { make in
            make.verticalEdges.leading.equalTo(contentView).inset(10)
        }
        descriptionLabel.sizeToFit()

        labelBackgroundView.snp.makeConstraints { make in
            make.bottom.trailing.equalTo(descriptionLabel).offset(5)
            make.top.leading.equalTo(descriptionLabel).offset(-5)
        }
    }
}
