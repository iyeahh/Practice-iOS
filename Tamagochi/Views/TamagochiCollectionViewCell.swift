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
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.secondary.cgColor
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

    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
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

    func setData(_ num: Int) {
        switch num {
        case 0:
            iconImageView.image = UIImage(named: "1-6")
            nameLabel.text = "따끔따끔 다마고치"
        case 1:
            iconImageView.image = UIImage(named: "2-6")
            nameLabel.text = "방실방실 다마고치"
        case 2:
            iconImageView.image = UIImage(named: "3-6")
            nameLabel.text = "반짝반짝 다마고치"
        default:
            iconImageView.image = UIImage(named: "noImage")
            nameLabel.text = "준비중이에요"
        }
    }
}
