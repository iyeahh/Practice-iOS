//
//  DetailViewController.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    var tamagochi: Tamagochi

    init(tamagochi: Tamagochi) {
        self.tamagochi = tamagochi
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let popUpView = {
        let view = UIView()
        view.backgroundColor = .primary
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()

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

    let barView = {
        let view = UIView()
        view.backgroundColor = .secondary
        return view
    }()

    let descriptionLabel = {
        let label = UILabel()
        label.font = UIFont.small
        label.textColor = .secondary
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let lineView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    let cancelButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.titleLabel?.font = .small
        button.backgroundColor = .lightGray.withAlphaComponent(0.3)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.layer.maskedCorners = .layerMinXMaxYCorner
        button.setTitleColor(.secondary, for: .normal)
        return button
    }()

    let startButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.titleLabel?.font = .small
        button.backgroundColor = .clear
        button.setTitleColor(.secondary, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureHierarchy()
        configureLayout()
        configureData()
    }

    private func configureUI() {
        view.backgroundColor = .black.withAlphaComponent(0.5)
    }

    private func configureHierarchy() {
        view.addSubview(popUpView)
        view.addSubview(iconImageView)
        view.addSubview(labelBackgroundView)
        view.addSubview(nameLabel)
        view.addSubview(barView)
        view.addSubview(descriptionLabel)
        view.addSubview(lineView)
        view.addSubview(cancelButton)
        view.addSubview(startButton)
    }

    private func configureLayout() {
        popUpView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }

        iconImageView.snp.makeConstraints { make in
            make.width.equalTo(popUpView.snp.width).multipliedBy(0.4)
            make.height.equalTo(iconImageView.snp.width)
            make.centerX.equalTo(popUpView.snp.centerX)
            make.top.equalTo(popUpView.snp.top).offset(40)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(5)
            make.centerX.equalTo(iconImageView.snp.centerX)
            make.height.equalTo(30)
        }
        nameLabel.sizeToFit()

        labelBackgroundView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(nameLabel)
            make.leading.equalTo(nameLabel.snp.leading).offset(-3)
            make.trailing.equalTo(nameLabel.snp.trailing).offset(3)
        }

        barView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(labelBackgroundView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(popUpView).inset(30)
        }

        cancelButton.snp.makeConstraints { make in
            make.leading.bottom.equalTo(popUpView)
            make.height.equalTo(40)
            make.width.equalTo(popUpView.snp.width).dividedBy(2)
        }

        startButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(popUpView)
            make.height.equalTo(40)
            make.width.equalTo(popUpView.snp.width).dividedBy(2)
        }

        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.horizontalEdges.equalTo(popUpView)
            make.bottom.equalTo(startButton.snp.top)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(popUpView).inset(30)
            make.top.equalTo(barView.snp.bottom).offset(5)
            make.bottom.equalTo(cancelButton.snp.top).offset(-5)
        }
    }

    private func configureData() {
        iconImageView.image = tamagochi.image
        nameLabel.text = tamagochi.fullName
        descriptionLabel.text = tamagochi.description
    }
}
