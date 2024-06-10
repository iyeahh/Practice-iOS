//
//  LoginViewController.swift
//  MediaProject
//
//  Created by Bora Yang on 6/4/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    let mainLable = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 25, weight: .black)
        label.text = "IYEAHFLIX"
        label.textAlignment = .center
        return label
    }()

    lazy var emailTextField = configureTextFieldUI(title: "이메일 주소 또는 전화번호")
    lazy var passwordTextField = configureTextFieldUI(title: "비밀번호")
    lazy var nicknameTextField = configureTextFieldUI(title: "닉네임")
    lazy var locationTextField = configureTextFieldUI(title: "위치")
    lazy var codeTextField = configureTextFieldUI(title: "추천 코드 입력")

    let joinButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return button
    }()

    let inputButton = {
        let button = UIButton()
        button.setTitle("추가 정보 입력", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return button
    }()

    let toggleSwitch = {
        let sw = UISwitch()
        sw.onTintColor = .red
        sw.setOn(true, animated: false)
        return sw
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarcy()
        configureLayout()
        view.backgroundColor = .black
    }

    private func configureHierarcy() {
        view.addSubview(mainLable)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nicknameTextField)
        view.addSubview(locationTextField)
        view.addSubview(codeTextField)
        view.addSubview(joinButton)
        view.addSubview(inputButton)
        view.addSubview(toggleSwitch)
    }

    private func configureLayout() {
        mainLable.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(70)
        }

        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLable.snp.bottom).offset(120)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(30)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(30)
        }

        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(30)
        }

        locationTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(15)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(30)
        }

        codeTextField.snp.makeConstraints { make in
            make.top.equalTo(locationTextField.snp.bottom).offset(15)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(30)
        }

        joinButton.snp.makeConstraints { make in
            make.top.equalTo(codeTextField.snp.bottom).offset(15)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(40)
        }

        inputButton.snp.makeConstraints { make in
            make.top.equalTo(joinButton.snp.bottom).offset(15)
            make.leading.equalTo(20)
            make.height.equalTo(30)
        }

        toggleSwitch.snp.makeConstraints { make in
            make.top.equalTo(joinButton.snp.bottom).offset(15)
            make.trailing.equalTo(-20)
        }
    }

    private func configureTextFieldUI(title: String) -> UITextField {
        let tf = UITextField()
        tf.layer.cornerRadius = 5
        tf.backgroundColor = .gray
        tf.text = title
        tf.textAlignment = .center
        tf.font = .systemFont(ofSize: 13)
        tf.textColor = .white
        return tf
    }
}
