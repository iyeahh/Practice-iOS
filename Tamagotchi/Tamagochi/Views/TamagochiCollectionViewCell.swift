//
//  TamagochiCollectionViewCell.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import UIKit
import SnapKit

class TamagochiCollectionViewCell: UICollectionViewCell {
    let iconImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let labelBackgroundView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.secondary.cgColor
        return view
    }()

    let nameLabel = {
        let label = UILabel()
        label.font = UIFont.small
        label.textColor = .secondary
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureHierarchy() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(labelBackgroundView)
        contentView.addSubview(nameLabel)
    }

    private func configureLayout() {
        iconImageView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(5)
            make.height.equalTo(iconImageView.snp.width)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(5)
            make.bottom.equalToSuperview().inset(5)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        nameLabel.sizeToFit()

        labelBackgroundView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(nameLabel)
            make.leading.equalTo(nameLabel.snp.leading).offset(-3)
            make.trailing.equalTo(nameLabel.snp.trailing).offset(3)
        }
    }

    func setData(_ data: Tamagochi) {
        iconImageView.image = data.image
        nameLabel.text = data.character.fullName
    }
}
