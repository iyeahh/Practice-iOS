//
//  HomeViewController.swift
//  MediaProject
//
//  Created by Bora Yang on 6/4/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    let mainPosterImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "노량")
        return imageView
    }()

    let subImageView1 = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "밀수")
        return imageView
    }()

    let subImageView2 = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "범죄도시3")
        return imageView
    }()

    let subImageView3 = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "육사오")
        return imageView
    }()

    let contentLabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "지금 뜨는 콘텐츠"
        return label
    }()

    let playButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("재생", for: .normal)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.tintColor = .black
        button.backgroundColor = .white
        return button
    }()

    let favoriteListButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("내가 찜한 리스트", for: .normal)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.tintColor = .white
        button.backgroundColor = .gray
        return button
    }()

    lazy var imageViewStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(subImageView1)
        stackView.addArrangedSubview(subImageView2)
        stackView.addArrangedSubview(subImageView3)
        return stackView
    }()

    lazy var buttonStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(favoriteListButton)
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureHierarcy()
        configureLayout()
    }

    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.1960791051, green: 0.1960778534, blue: 0.1656680405, alpha: 1)
        navigationItem.title = "iyeah님"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    private func configureHierarcy() {
        view.addSubview(mainPosterImageView)
        view.addSubview(buttonStackView)
        view.addSubview(contentLabel)
        view.addSubview(imageViewStackView)
    }

    private func configureLayout() {
        mainPosterImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalToSuperview().multipliedBy(0.5)
        }

        buttonStackView.snp.makeConstraints { make in
            make.leading.equalTo(mainPosterImageView.snp.leading).offset(10)
            make.trailing.equalTo(mainPosterImageView.snp.trailing).offset(-10)
            make.bottom.equalTo(mainPosterImageView.snp.bottom).offset(-10)
            make.height.equalTo(40)
        }

        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(mainPosterImageView.snp.bottom).offset(5)
            make.leading.equalTo(10)
            make.height.equalTo(20)
        }

        imageViewStackView.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-5)
        }
    }
}
