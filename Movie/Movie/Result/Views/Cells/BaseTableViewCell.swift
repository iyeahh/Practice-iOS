//
//  BaseTableView.swift
//  Movie
//
//  Created by Bora Yang on 6/25/24.
//

import UIKit
import SnapKit

class BaseTableViewCell: UITableViewCell {
    let titleLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureHierarchy() {
        contentView.addSubview(titleLabel)
    }

    func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)
        }
    }

    private func configureView() {
        contentView.backgroundColor = .black
    }
}
