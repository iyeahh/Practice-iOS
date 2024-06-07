//
//  GrowViewController.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import UIKit
import SnapKit

class GrowViewController: UIViewController {
    var tamagochi: Tamagochi {
        didSet {
            configureData()
        }
    }

    var randomStory: [String] = [
        "고래밥님, 밥주세요",
        "좋은 하루에요, 고래밥님",
        "밥과 물을 잘먹었더니 레벨업 했어요 고마워요 고래밥님",
        "복습 아직 안하셨다구요? 지금 잠이 오세여? 고래밥님??",
        "테이블뷰 컨트롤러와 뷰 컨트롤러는 어떤 차이가 있을까요?",
        "고래밥님 오늘 깃허브 푸쉬 하셨어영?"
    ]

    let storyImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bubble")
        return imageView
    }()

    let storyLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .small
        label.textAlignment = .center
        label.textColor = .secondary
        return label
    }()

    lazy var iconImageView = configureIconImageView()
    lazy var labelBackgroundView = configureLabelBackgroundView()
    lazy var nameLabel = configureNameLabel()

    let descriptionLabel = {
        let label = UILabel()
        label.font = .small
        label.textAlignment = .center
        label.textColor = .secondary
        label.text = "ddddd"
        return label
    }()

    lazy var riceTextField = configureTextField("밥")
    lazy var riceButton = configureButton("밥")
    lazy var riceBarView = configureBarView(color: .secondary)

    lazy var waterTextField = configureTextField("물")
    lazy var waterButton = configureButton("물")
    lazy var waterBarView = configureBarView(color: .secondary)

    init(tamagochi: Tamagochi) {
        self.tamagochi = tamagochi
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureHierarchy()
        configureLayout()
        configureData()
        configureTextField()
        addTargetButton()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }

    private func configureUI() {
        navigationItem.title = "대장님의 다마고치"
        view.backgroundColor = .primary
        let barItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: nil, action: nil)
        barItem.tintColor = .secondary
        navigationItem.rightBarButtonItem = barItem
    }

    private func configureHierarchy() {
        view.addSubview(storyImageView)
        view.addSubview(storyLabel)
        view.addSubview(iconImageView)
        view.addSubview(labelBackgroundView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(riceTextField)
        view.addSubview(riceButton)
        view.addSubview(riceBarView)
        view.addSubview(waterTextField)
        view.addSubview(waterButton)
        view.addSubview(waterBarView)
    }

    private func configureLayout() {
        storyImageView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.6)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(storyImageView.snp.width).multipliedBy(0.6)
        }

        storyLabel.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(storyImageView).inset(20)
            make.top.equalTo(storyImageView.snp.top).offset(10)
        }

        iconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(storyImageView.snp.width).multipliedBy(0.9)
            make.top.equalTo(storyImageView.snp.bottom).offset(3)
            make.centerX.equalTo(view.snp.centerX)
        }

        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.top.equalTo(iconImageView.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
        }
        nameLabel.sizeToFit()

        labelBackgroundView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(nameLabel)
            make.leading.equalTo(nameLabel.snp.leading).offset(-3)
            make.trailing.equalTo(nameLabel.snp.trailing).offset(3)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.width.equalTo(iconImageView.snp.width)
            make.top.equalTo(labelBackgroundView.snp.bottom).offset(3)
            make.height.equalTo(20)
            make.centerX.equalTo(view.snp.centerX)
        }

        riceButton.snp.makeConstraints { make in
            make.trailing.equalTo(storyImageView.snp.trailing)
            make.width.equalTo(70)
            make.height.equalTo(30)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
        }

        waterButton.snp.makeConstraints { make in
            make.trailing.equalTo(storyImageView.snp.trailing)
            make.width.equalTo(70)
            make.height.equalTo(30)
            make.top.equalTo(riceButton.snp.bottom).offset(10)
        }

        riceBarView.snp.makeConstraints { make in
            make.leading.equalTo(storyImageView.snp.leading)
            make.trailing.equalTo(riceButton.snp.leading).offset(-5)
            make.height.equalTo(1)
            make.bottom.equalTo(riceButton.snp.bottom)
        }

        waterBarView.snp.makeConstraints { make in
            make.leading.equalTo(storyImageView.snp.leading)
            make.trailing.equalTo(waterButton.snp.leading).offset(-5)
            make.height.equalTo(1)
            make.bottom.equalTo(waterButton.snp.bottom)
        }

        riceTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(riceBarView)
            make.top.equalTo(riceButton.snp.top)
            make.bottom.equalTo(riceBarView.snp.top)
        }

        waterTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(waterBarView)
            make.top.equalTo(waterButton.snp.top)
            make.bottom.equalTo(waterBarView.snp.top)
        }
    }

    private func configureData() {
        storyLabel.text = randomStory.randomElement()
        nameLabel.text = tamagochi.character.fullName
        iconImageView.image = tamagochi.image
        descriptionLabel.text = tamagochi.exp.description
    }

    private func configureTextField() {
        riceTextField.delegate = self
        waterTextField.delegate = self
    }

    private func addTargetButton() {
        riceButton.addTarget(self, action: #selector(riceButtonTapped), for: .touchUpInside)
        waterButton.addTarget(self, action: #selector(waterButtonTapped), for: .touchUpInside)
    }

    @objc private func riceButtonTapped() {
        guard let text = riceTextField.text,
              let count = Int(text)
        else {
            UserDefaultManager.riceCount += 1
            tamagochi.exp.riceCount = UserDefaultManager.riceCount
            riceTextField.text = ""
            return
        }
        UserDefaultManager.riceCount += count
        tamagochi.exp.riceCount = UserDefaultManager.riceCount
        riceTextField.text = ""
    }

    @objc private func waterButtonTapped() {
        guard let text = waterTextField.text,
              let count = Int(text)
        else {
            UserDefaultManager.waterCount += 1
            tamagochi.exp.waterCount = UserDefaultManager.waterCount
            waterTextField.text = ""
            return
        }
        UserDefaultManager.waterCount += count
        tamagochi.exp.waterCount = UserDefaultManager.waterCount
        waterTextField.text = ""
    }
}

extension GrowViewController: UITextFieldDelegate {

}
