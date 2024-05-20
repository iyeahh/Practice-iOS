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

        searchImageView.image = UIImage(systemName: "magnifyingglass")

        searchImageView.backgroundColor = .clear
        searchImageView.tintColor = .gray

        searchTextField.backgroundColor = .clear
        searchTextField.attributedPlaceholder = NSAttributedString(string: "게임, 시리즈, 영화를 검색하세요...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        searchTextField.borderStyle = .none

        firstButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        firstButton.backgroundColor = .white
        firstButton.layer.masksToBounds = true
        firstButton.layer.cornerRadius = 10
        firstButton.setImage(UIImage(named: "blue"), for: .normal)
        firstButton.setTitle("공개 예정", for: .normal)
        firstButton.setTitleColor(.black, for: .normal)

        secondButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        secondButton.backgroundColor = .clear
        secondButton.layer.masksToBounds = true
        secondButton.layer.cornerRadius = 10
        secondButton.setImage(UIImage(named: "turquoise"), for: .normal)
        secondButton.setTitle("모두의 인기 콘텐츠", for: .normal)
        secondButton.setTitleColor(.white, for: .normal)

        thirdButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        thirdButton.backgroundColor = .clear
        thirdButton.layer.masksToBounds = true
        thirdButton.layer.cornerRadius = 10
        thirdButton.setImage(UIImage(named: "pink"), for: .normal)
        thirdButton.setTitle("TOP 10 시리즈", for: .normal)
        thirdButton.setTitleColor(.white, for: .normal)

        resultLabel.text = "이런! 찾으시는 작품이 없습니다."
        resultLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        resultLabel.numberOfLines = 0
        resultLabel.textColor = .white
        resultLabel.textAlignment = .center

    }

    @IBAction func firstButtonTapped(_ sender: UIButton) {
        resultLabel.text = "공개 예정 영화는!!!!!"

        firstButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        firstButton.backgroundColor = .white
        firstButton.setTitleColor(.black, for: .normal)

        secondButton.backgroundColor = .clear
        secondButton.setTitleColor(.white, for: .normal)

        thirdButton.backgroundColor = .clear
        thirdButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        resultLabel.text = "모두의 인기 콘텐츠는!!!!!"

        firstButton.backgroundColor = .clear
        firstButton.setTitleColor(.white, for: .normal)

        secondButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        secondButton.backgroundColor = .white
        secondButton.setTitleColor(.black, for: .normal)

        thirdButton.backgroundColor = .clear
        thirdButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        resultLabel.text = "TOP 10 시리즈는!!!!!"

        firstButton.backgroundColor = .clear
        firstButton.setTitleColor(.white, for: .normal)

        secondButton.backgroundColor = .clear
        secondButton.setTitleColor(.white, for: .normal)

        thirdButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        thirdButton.backgroundColor = .white
        thirdButton.setTitleColor(.black, for: .normal)
    }
    

}
