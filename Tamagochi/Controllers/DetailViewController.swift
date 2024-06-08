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
    var status: Status

    let popUpView = {
        let view = UIView()
        view.backgroundColor = .primary
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()

    lazy var iconImageView = configureIconImageView()
    lazy var labelBackgroundView = configureLabelBackgroundView()
    lazy var nameLabel = configureNameLabel()

    lazy var barView = configureBarView(color: .secondary)

    let descriptionLabel = {
        let label = UILabel()
        label.font = UIFont.small
        label.textColor = .secondary
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    lazy var lineView = configureBarView(color: .lightGray)

    let cancelButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.titleLabel?.font = .small
        button.backgroundColor = .lightGray.withAlphaComponent(0.3)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.layer.maskedCorners = .layerMinXMaxYCorner
        button.setTitleColor(.secondary, for: .normal)
        button.addTarget(nil, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()

    lazy var startButton = {
        let button = UIButton()
        button.setTitle(self.status.buttonTitle, for: .normal)
        button.titleLabel?.font = .small
        button.backgroundColor = .clear
        button.setTitleColor(.secondary, for: .normal)
        button.addTarget(nil, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()

    init(tamagochi: Tamagochi, status: Status) {
        self.tamagochi = tamagochi
        self.status = status
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
        nameLabel.text = tamagochi.character.fullName
        descriptionLabel.text = tamagochi.character.description
    }

    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }

    @objc private func startButtonTapped() {
        let vc = UINavigationController(rootViewController: GrowViewController(tamagochi: tamagochi))
        vc.modalPresentationStyle = .fullScreen
        UserDefaultManager.character = tamagochi.character.rawValue
        UserDefaultManager.isSelected = true
        present(vc, animated: true)
    }
}
