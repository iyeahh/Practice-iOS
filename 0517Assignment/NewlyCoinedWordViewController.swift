//
//  NewlyCoinedWordViewController.swift
//  0517Assignment
//
//  Created by Bora Yang on 5/19/24.
//

import UIKit

class NewlyCoinedWordViewController: UIViewController, UIGestureRecognizerDelegate{

    var newlyCoinedWord = [("원영적 사고", "역시 행운의 여신은 나의 편이야\n럭키비키잖아 >.~"), ("중꺾그마", "중요한 건 꺾여도 그냥 하는 마음 🥹"), ("KIJUL", "너무 재밌어서 기절하겠다 ^_^"), ("기나죄", "기분 나빴다면 죄송합니다 ㅎ.ㅎ"), ("지팔지꼰", "자기 팔자 자기가 꼰다 😊")]

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldUI()
        setupSearchWordButtonUI()
        setupResultLabelUI()

        let tapGesture = UITapGestureRecognizer()
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
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
        setSearchWordButtonRandomTitle()

        // OuletCollection 활용
        buttonCollection.forEach { button in
            button.configuration?.buttonSize = .small
            button.layer.masksToBounds = true
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.tintColor = .black
        }
    }

    func setupResultLabelUI() {
        resultLabel.text = "연애를 시작하기 전 썸 단계!"
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        resultLabel.font = UIFont.systemFont(ofSize: 20)
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        view.endEditing(true)
        return true
    }

    func searchWord() {
        if newlyCoinedWord.contains(where: { (keyword, _) in
            keyword == inputTextField.text
        }) {
            let word = newlyCoinedWord.filter { (keyword, _) in
                keyword == inputTextField.text
            }
            resultLabel.text = word[0].1
        } else {
            resultLabel.text = "검색 결과가 없습니다."
        }
    }

    func setSearchWordButtonRandomTitle() {
        var newlyCoinedWord = [("원영적 사고", "역시 행운의 여신은 나의 편이야\n럭키비키잖아 >.~"), ("중꺾그마", "중요한 건 꺾여도 그냥 하는 마음 🥹"), ("KIJUL", "너무 재밌어서 기절하겠다 ^_^"), ("기나죄", "기분 나빴다면 죄송합니다 ㅎ.ㅎ"), ("지팔지꼰", "자기 팔자 자기가 꼰다 😊")]

        buttonCollection.forEach { button in
            let randomWord = newlyCoinedWord.randomElement()?.0
            button.setTitle(randomWord, for: .normal)
            let index = newlyCoinedWord.firstIndex { (keyword, _) in
                keyword == randomWord
            }
            newlyCoinedWord.remove(at: index!)
        }
    }

    // 중복되는 로직 Any로 구현
    @IBAction func searchWordTapped(_ sender: Any) {
        searchWord()
        setSearchWordButtonRandomTitle()
    }

    @IBAction func searchWordButtonTapped(_ sender: UIButton) {
        inputTextField.text = sender.currentTitle

        let index = newlyCoinedWord.firstIndex { (keyword, _) in
            sender.currentTitle! == keyword
        }
        resultLabel.text = newlyCoinedWord[index!].1

        setSearchWordButtonRandomTitle()
    }
}
