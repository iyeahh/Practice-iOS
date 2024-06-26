//
//  MovieDescriptionTableViewCell.swift
//  MediaProject
//
//  Created by Bora Yang on 6/12/24.
//

import UIKit
import SnapKit

class MovieDescriptionTableViewCell: UITableViewCell {
//    var callBackMehtod: ((Bool) -> Void)?
    var selectedBtn: Bool = false

    let descriptionLabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 10)
        return label
    }()

    let showMoreButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .black
//        button.addTarget(nil, action: #selector(showMoreButtonTapped), for: .touchUpInside)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureHierarchy() {
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(showMoreButton)
    }

    private func configureLayout() {
        descriptionLabel.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(contentView).inset(20)
            make.height.equalTo(50)
        }

        showMoreButton.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.bottom.equalTo(contentView).inset(10)
            make.width.equalTo(showMoreButton.snp.height).multipliedBy(2)
        }
    }

//    @objc func showMoreButtonTapped(completion: @escaping (Bool) -> Void) {
//        selectedBtn = !selectedBtn
//        callBackMehtod?(selectedBtn)
//    }

    func setData(_ data: String) {
        descriptionLabel.text = data
    }
}
