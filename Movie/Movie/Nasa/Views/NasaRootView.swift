//
//  NasaRootView.swift
//  Movie
//
//  Created by Bora Yang on 7/1/24.
//

import UIKit

protocol NasaRootViewDelegate {
    func requestButtonTapped()
}

final class NasaRootView: UIView {
    let mainImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.image = UIImage(systemName: "heart")
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let progressLabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
        label.backgroundColor = .white
        return label
    }()

    private let requestButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        button.setTitle("이미지 다운받기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 13)
        return button
    }()

    var delegate: NasaRootViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy() {
        addSubview(mainImageView)
        addSubview(progressLabel)
        addSubview(requestButton)
    }

    private func configureLayout() {
        mainImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(mainImageView.snp.width)
        }

        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }

        requestButton.snp.makeConstraints { make in
            make.top.equalTo(progressLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
    }

    private func configureButton() {
        requestButton.addTarget(self, action: #selector(requestButtonTapped), for: .touchUpInside)
    }

    @objc private func requestButtonTapped() {
        delegate?.requestButtonTapped()
    }
}
