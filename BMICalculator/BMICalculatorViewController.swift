//
//  ViewController.swift
//  BMICalculator
//
//  Created by Bora Yang on 5/21/24.
//

import UIKit

class BMICalculatorViewController: UIViewController {

    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var backgroundViews: [UIView]!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var hideButton: UIButton!
    @IBOutlet var randomCalculatorButton: UIButton!
    @IBOutlet var calculatorButton: UIButton!

    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        setupInfoLabelUI()
        setupMainImageViewUI()
        setupBackgroundViewsUI()
        setupTextFieldUI()
        setupHideButtonUI()
        setupRandomCalculatorButtonUI()
        setupCalculatorButtonUI()
    }

    func setupInfoLabelUI() {
        infoLabel.text = "당신의 BMI 지수를\n알려드릴게요."
    }

    func setupMainImageViewUI() {
        mainImageView.image = UIImage(named: "image")
        mainImageView.contentMode = .scaleAspectFill
    }

    func setupBackgroundViewsUI() {
        backgroundViews.forEach { view in
            view.layer.borderColor = UIColor.black.cgColor
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 15
        }
    }

    func setupTextFieldUI() {
        heightTextField.borderStyle = .none

        weightTextField.borderStyle = .none
        weightTextField.isSecureTextEntry = true
    }

    func setupHideButtonUI() {
        hideButton.setTitle("", for: .normal)
        hideButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        hideButton.tintColor = .gray
    }

    func setupRandomCalculatorButtonUI() {
        randomCalculatorButton.tintColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
    }

    func setupCalculatorButtonUI() {
        calculatorButton.layer.masksToBounds = true
        calculatorButton.layer.cornerRadius = 10
        calculatorButton.backgroundColor = .purple
        calculatorButton.setTitle("결과 확인", for: .normal)
        calculatorButton.setTitleColor(.white, for: .normal)
        calculatorButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    }


    func calculateBMI(weight: Int, height: Int) -> Int {
        let bmi = (Double(weight) / (Double(height) * Double(height))) * 10000
        return Int(bmi)
    }

    func presentAlert(bmi: Int) {
        // 1. 큰 틀 만들기
        let alert = UIAlertController(
            title: "BMI 계산 완료", // nil != ""
            message: "당신의 BMI는 \(bmi) 입니다.",
            preferredStyle: .alert)

        // 2. 버튼 만들기
        let cancel = UIAlertAction(
            title: "다시 계산해보기",
            style: .cancel,
            handler: nil )

        // 3. 합치기
        alert.addAction(cancel) // 무조건 가장 아래, 왼쪽으로 배치됨 (.cancel 이기 때문에)

        // 4. 보여주기
        present(alert, animated: true)
    }

    @IBAction func hideButtonTapped(_ sender: UIButton) {
        weightTextField.isSecureTextEntry.toggle()
    }

    @IBAction func randomCalculatorButtonTapped(_ sender: UIButton) {
        let randomWeight = Int.random(in: 30...120)
        let randomHeight = Int.random(in: 140...200)
        let randomBmi = calculateBMI(weight: randomWeight, height: randomHeight)
        print(randomBmi)

        presentAlert(bmi: randomBmi)
    }

    @IBAction func calculatorButtonTapped(_ sender: UIButton) {
        var height = 0
        var weight = 0

        guard let input = heightTextField.text,
              let userHeight = Int(input) else { return }
        height = userHeight

        guard let input = weightTextField.text,
              let userWeight = Int(input) else { return }
        weight = userWeight

        let userBmi = calculateBMI(weight: weight, height: height)
        presentAlert(bmi: userBmi)

        view.endEditing(true)
    }

    @IBAction func gestureTapped(_ sender: UITapGestureRecognizer) {
        heightLabel.text = "키가 어떻게 되시나요?"
        weightLabel.text = "몸무게가 어떻게 되시나요?"

        view.endEditing(true)
    }

    @IBAction func textFieldDidBegin(_ sender: UITextField) {
        if sender.tag == 0 {
            heightLabel.text = "키가 어떻게 되시나요?"
        } else if sender.tag == 1 {
            weightLabel.text = "몸무게가 어떻게 되시나요?"
        }
    }

    @IBAction func textFieldEditingEnd(_ sender: UITextField) {
        if sender.tag == 0 {
            guard let inputText = sender.text else {
                return
            }

            guard let userHeight = Int(inputText) else {
                heightLabel.text = "숫자를 입력해 주세요"
                heightTextField.text = ""
                return
            }

            if userHeight < 140 || userHeight > 200 {
                heightLabel.text = "140 ~ 200 사이로 입력해 주세요"
                heightTextField.text = ""
            }

        } else if sender.tag == 1 {
            guard let inputText = sender.text else {
                return
            }

            guard let userWeight = Int(inputText) else {
                weightLabel.text = "숫자를 입력해 주세요"
                weightTextField.text = ""
                return
            }

            if userWeight < 30 || userWeight > 120 {
                weightLabel.text = "30 ~ 120 사이로 입력해 주세요"
                weightTextField.text = ""
            }
        }
    }
}

