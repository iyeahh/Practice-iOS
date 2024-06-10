//
//  LoginViewController.swift
//  0514Practice
//
//  Created by Bora Yang on 5/16/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nickNameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var codeTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var toggleSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeTextField.keyboardType = .numberPad
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let emailText = emailTextField.text,
              let passwordText = passwordTextField.text,
              let nicknameText = nickNameTextField.text,
              let locationText = locationTextField.text,
              let codeText = codeTextField.text else { return }

        if emailText.isEmpty ||
            passwordText.isEmpty ||
            nicknameText.isEmpty ||
            locationText.isEmpty ||
            codeText.isEmpty {
            loginButton.backgroundColor = .gray
        }
        
        view.endEditing(true)
    }
}
