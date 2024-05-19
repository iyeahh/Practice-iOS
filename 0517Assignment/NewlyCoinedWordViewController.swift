//
//  NewlyCoinedWordViewController.swift
//  0517Assignment
//
//  Created by Bora Yang on 5/19/24.
//

import UIKit

class NewlyCoinedWordViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var searchButton: UIButton!

    @IBOutlet var searchWordButton1: UIButton!
    @IBOutlet var searchWordButton2: UIButton!
    @IBOutlet var searchWordButton3: UIButton!
    @IBOutlet var searchWordButton4: UIButton!

    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldUI()
        setupSearchWordButtonUI()
        setupResultLabelUI()
    }

    func setupTextFieldUI() {
        backgroundView.layer.borderWidth = 2
        backgroundView.layer.borderColor = UIColor.black.cgColor

        inputTextField.borderStyle = .none
        inputTextField.text = "삼귀자"

        searchButton.backgroundColor = .black
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
    }

    func setupSearchWordButtonUI() {
        let buttons = [searchWordButton1, searchWordButton2, searchWordButton3, searchWordButton4]
        searchWordButton1.setTitle("윰차", for: .normal)

        buttons.forEach { button in
            button?.configuration?.buttonSize = .small
            button?.layer.masksToBounds = true
            button?.layer.cornerRadius = 10
            button?.layer.borderWidth = 1
            button?.layer.borderColor = UIColor.black.cgColor
            button?.tintColor = .black
        }
    }

    func setupResultLabelUI() {
        resultLabel.text = "연애를 시작하기 전 썸 단계!"
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        resultLabel.font = UIFont.systemFont(ofSize: 20)
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
    }

    @IBAction func searchWordButtonTapped1(_ sender: UIButton) {
    }
    
    @IBAction func searchWordButtonTapped2(_ sender: UIButton) {
    }
    
    @IBAction func searchWordButtonTapped3(_ sender: UIButton) {
    }
    
    @IBAction func searchWordButtonTapped4(_ sender: UIButton) {
    }
}
