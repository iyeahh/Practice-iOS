//
//  SearchViewController.swift
//  0514Practice
//
//  Created by Bora Yang on 5/16/24.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var searchImageView: UIImageView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        backgroundView.backgroundColor = .darkGray

        setupSearchImageViewUI()
        setupSearchTextFieldUI()
        setupResultLabelUI()

        setupButtonUI(firstButton,
                      backgroundColor: .white,
                      image: "blue",
                      title: "공개 예정",
                      titleColor: .black)

        setupButtonUI(secondButton,
                      backgroundColor: .clear,
                      image: "turquoise",
                      title: "모두의 인기 콘텐츠",
                      titleColor: .white)

        setupButtonUI(thirdButton,
                      backgroundColor: .clear,
                      image: "pink",
                      title: "TOP 10 시리즈",
                      titleColor: .white)
    }

    func setupSearchImageViewUI() {
        searchImageView.image = UIImage(systemName: "magnifyingglass")
        searchImageView.backgroundColor = .clear
        searchImageView.tintColor = .gray
    }

    func setupSearchTextFieldUI() {
        searchTextField.backgroundColor = .clear
        searchTextField.attributedPlaceholder = NSAttributedString(string: "게임, 시리즈, 영화를 검색하세요...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        searchTextField.borderStyle = .none
    }

    func setupResultLabelUI() {
        resultLabel.text = "이런! 찾으시는 작품이 없습니다."
        resultLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        resultLabel.numberOfLines = 0
        resultLabel.textColor = .white
        resultLabel.textAlignment = .center
    }

    func setupButtonUI(_ button: UIButton, 
                       backgroundColor: UIColor,
                       image: String,
                       title: String,
                       titleColor: UIColor) {
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.backgroundColor = backgroundColor
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "\(image)"), for: .normal)
        button.setTitle("\(title)", for: .normal)
        button.setTitleColor(titleColor, for: .normal)
    }

    func setBasicButtonUI(_ button: UIButton) {
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
    }

    func setSelectedButtonUI(_ button: UIButton) {
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
    }

    @IBAction func firstButtonTapped(_ sender: UIButton) {
        resultLabel.text = "공개 예정 영화는!!!!!"

        setSelectedButtonUI(firstButton)
        setBasicButtonUI(secondButton)
        setBasicButtonUI(thirdButton)
    }

    @IBAction func secondButtonTapped(_ sender: UIButton) {
        resultLabel.text = "모두의 인기 콘텐츠는!!!!!"

        setBasicButtonUI(firstButton)
        setSelectedButtonUI(secondButton)
        setBasicButtonUI(thirdButton)
    }

    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        resultLabel.text = "TOP 10 시리즈는!!!!!"

        setBasicButtonUI(firstButton)
        setBasicButtonUI(secondButton)
        setSelectedButtonUI(thirdButton)
    }
}
