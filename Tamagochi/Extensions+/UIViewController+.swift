//
//  UIViewController+.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import UIKit

extension UIViewController {
    func configureIconImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.secondary.cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }

    func configureLabelBackgroundView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.secondary.cgColor
        return view
    }

    func configureNameLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.small
        label.textColor = .secondary
        label.textAlignment = .center
        label.text = "dDddddd"
        return label
    }

    func configureTextField(_ word: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = word + "주세용"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.borderStyle = .none
        textField.font = .small
        return textField
    }

    func configureButton(_ word: String) -> UIButton {
        let button = UIButton()
        button.layer.borderColor = UIColor.secondary.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.setTitle(word + "먹기", for: .normal)
        button.tintColor = .secondary
        button.setTitleColor(.secondary, for: .normal)
        button.titleLabel?.font = .small
        return button
    }

    func configureBarView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
}
