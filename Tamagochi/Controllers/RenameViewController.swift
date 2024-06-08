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
        configureNavi()
        configureHeierarchy()
        configureLayout()
        configureTextField()
    }

    private func configureUI() {
        view.backgroundColor = .primary
    }

    private func configureNavi() {
        navigationItem.title = "대장님 이름 정하기"
        let button = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        button.tintColor = .secondary
        navigationItem.rightBarButtonItem = button
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.secondary]
    }

    private func configureHeierarchy() {
        view.addSubview(textField)
        view.addSubview(barView)
    }

    private func configureLayout() {
        textField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(50)
        }

        barView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(textField.snp.bottom).offset(1)
            make.height.equalTo(1)
        }
    }

    private func configureTextField() {
        textField.text = UserDefaultManager.nickname
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @objc private func saveButtonTapped() {
        guard let text = textField.text,
              !text.isEmpty else {
            return
        }
        UserDefaultManager.nickname = text
        navigationController?.popViewController(animated: true)
    }

    @objc private func textFieldDidChange(_ sender: UITextField) {
        if sender.text == "" {
            sender.placeholder = "대장님의 이름을 알려주세요!"
        }
    }
}
