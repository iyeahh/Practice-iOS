//
//  WeatherImageTableViewCell.swift
//  MediaProject
//
//  Created by Bora Yang on 6/8/24.
//

import UIKit

class WeatherImageTableViewCell: UITableViewCell {
    
    let imageBackgroundView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()

    let weatherImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        contentView.addSubview(imageBackgroundView)
        contentView.addSubview(weatherImageView)
    }

    private func configureLayout() {
        weatherImageView.snp.makeConstraints { make in
            make.verticalEdges.leading.equalTo(contentView).inset(10)
            make.width.equalTo(200)
        }

        imageBackgroundView.snp.makeConstraints { make in
            make.bottom.trailing.equalTo(weatherImageView).offset(5)
            make.top.leading.equalTo(weatherImageView).offset(-5)
        }
    }

}
