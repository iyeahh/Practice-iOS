//
//  NewlyCoinedWordViewController.swift
//  0517Assignment
//
//  Created by Bora Yang on 5/19/24.
//

import UIKit

class NewlyCoinedWordViewController: UIViewController {

    var newlyCoinedWord = ["원영적 사고": "역시 행운의 여신은 나의 편이야\n럭키비키잖아 >.~", "중꺾그마": "중요한 건 꺾여도 그냥 하는 마음 🥹", "KIJUL": "너무 재밌어서 기절하겠다 ^_^", "기나죄": "기분 나빴다면 죄송합니다 ㅎ.ㅎ", "지팔지꼰": "자기 팔자 자기가 꼰다 😊"]

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

    func searchWord() {
        let condition: ((String,String)) -> Bool = { dic in
            dic.0 == self.inputTextField.text
        }

        if newlyCoinedWord.contains(where: condition) {
            let word = newlyCoinedWord.filter(condition)
            resultLabel.text = word[inputTextField.text!]
        } else {
            resultLabel.text = "검색 결과가 없습니다."
        }
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchWord()
    }

    @IBAction func searchTextFieldTapped(_ sender: UITextField) {
        searchWord()
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
