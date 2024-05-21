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
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var hideButton: UIButton!
    @IBOutlet var randomCalculatorButton: UIButton!
    @IBOutlet var calculatorButton: UIButton!

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
        textFields.forEach { textField in
            textField.borderStyle = .none
            textField.keyboardType = .numberPad
        }
    }

    func setupHideButtonUI() {
        hideButton.setImage(UIImage(named: "eye.slash"), for: .normal)
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
}

