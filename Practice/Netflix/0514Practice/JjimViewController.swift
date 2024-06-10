//
//  JjimViewController.swift
//  0514Practice
//
//  Created by Bora Yang on 5/16/24.
//

import UIKit

class JjimViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        setupMainLabelUI()
        setupSubLabelUI()
        setupMainImageViewUI()
        setupSaveButtonUI()
        setupSearchButtonUI()
    }

    func setupMainLabelUI() {
        mainLabel.text = "'나만의 자동 저장' 기능"
        mainLabel.textColor = .white
        mainLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        mainLabel.textAlignment = .center
    }

    func setupSubLabelUI() {
        subLabel.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해드립니다.\n디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        subLabel.textColor = .gray
        subLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        subLabel.textAlignment = .center
        subLabel.numberOfLines = 0
    }

    func setupMainImageViewUI() {
        mainImageView.image = UIImage(named: "dummy")
        mainImageView.contentMode = .scaleAspectFit
    }

    func setupSaveButtonUI() {
        saveButton.backgroundColor = .blue
        saveButton.setTitle("설정하기", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        saveButton.layer.masksToBounds = true
        saveButton.layer.cornerRadius = 10
    }

    func setupSearchButtonUI() {
        searchButton.backgroundColor = .white
        searchButton.setTitle("저장 가능한 콘텐츠 살펴보기", for: .normal)
        searchButton.setTitleColor(.black, for: .normal)
        searchButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        searchButton.layer.masksToBounds = true
        searchButton.layer.cornerRadius = 10
    }
}
