//
//  RenameViewController.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/8/24.
//

import UIKit
import SnapKit

class RenameViewController: UIViewController {
    let textField = {
        let textField = UITextField()
        return textField
    }()

    lazy var barView = configureBarView(color: .secondary)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureHeierarchy()
        configureLayout()
        configureTextField()
    }

    private func configureUI() {
        view.backgroundColor = .primary
        let button = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        button.tintColor = .secondary
        navigationItem.rightBarButtonItem = button
    }

    private func configureHeierarchy() {
        view.addSubview(textField)
        view.addSubview(barView)
    }

    private func configureLayout() {
        textField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.height.equalTo(50)
        }

        barView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(textField.snp.bottom).offset(1)
            make.height.equalTo(1)
        }
    }

    private func configureTextField() {
        textField.delegate = self
    }

    @objc private func saveButtonTapped() {
        guard let text = textField.text,
              !text.isEmpty else {
            return
        }
        UserDefaultManager.nickname = text
        navigationController?.popViewController(animated: true)
    }
}

extension RenameViewController: UITextFieldDelegate {
    
}
