//
//  LottoViewController.swift
//  MediaProject
//
//  Created by Bora Yang on 6/5/24.
//

import UIKit
import SnapKit
import Alamofire

class LottoViewController: UIViewController {

    let numberPickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()

    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.inputView = numberPickerView
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()

    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "당첨번호 안내"
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .left
        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 10)
        label.text = "날짜"
        return label
    }()

    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()

    let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "1110회 당첨결과"
        return label
    }()

    lazy var numberLabel1 = configureNumberLabel()
    lazy var numberLabel2 = configureNumberLabel()
    lazy var numberLabel3 = configureNumberLabel()
    lazy var numberLabel4 = configureNumberLabel()
    lazy var numberLabel5 = configureNumberLabel()
    lazy var numberLabel6 = configureNumberLabel()
    lazy var numberLabel7 = configureNumberLabel()
    lazy var numberLabel8 = configureNumberLabel()

    lazy var numberLabels: [UILabel] = [
        numberLabel1, numberLabel2, numberLabel3, numberLabel4, numberLabel5, numberLabel6, numberLabel7, numberLabel8
    ]

    lazy var numberLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        numberLabels.forEach { label in
            stackView.addArrangedSubview(label)
        }
        return stackView
    }()

    let bonusLabel: UILabel = {
        let label = UILabel()
        label.text = "보너스"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 8)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierachy()
        configureLayout()
        configureUI()
        configurePickerView()
        callRequest(number: 1110)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }

    private func configureHierachy() {
        view.addSubview(inputTextField)
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
        view.addSubview(barView)
        view.addSubview(resultLabel)
        view.addSubview(numberLabelStackView)
        view.addSubview(bonusLabel)
    }

    private func configureLayout() {
        inputTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }

        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(inputTextField.snp.bottom).offset(20)
            make.leading.equalTo(5)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(inputTextField.snp.bottom).offset(20)
            make.trailing.equalToSuperview().inset(5)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }

        barView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(5)
            make.height.equalTo(1)
        }

        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(barView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
        }

        numberLabelStackView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(5)
            make.height.equalTo(numberLabel1.snp.width)
        }

        bonusLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(5)
            make.top.equalTo(numberLabelStackView.snp.bottom).offset(2)
            make.width.equalTo(numberLabel1.snp.width)
            make.height.equalTo(15)
        }
    }

    private func configureUI() {
        view.backgroundColor = .white
    }

    private func configurePickerView() {
        numberPickerView.delegate = self
        numberPickerView.dataSource = self
    }

    private func configureNumberLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 13)
        label.layer.cornerRadius = label.frame.width / 2
        label.clipsToBounds = true
        label.backgroundColor = .gray
        label.textAlignment = .center
        return label
    }

    private func callRequest(number: Int) {
        let url = URLString.lotto + "\(number)"
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                self.setData(value)
            case .failure(let error):
                print(error)
            }
        }
    }

    private func setData(_ data: Lotto) {
        dateLabel.text = data.date
        resultLabel.text = data.numberDescription
        setNumberLabels(data)
    }

    private func setNumberLabels(_ data: Lotto) {
        let numbers = data.sortedNumber
        for num in 0...5 {
            numberLabels[num].text = "\(numbers[num])"
            numberLabels[num].backgroundColor = numbers[num].backgroundColor
        }

        numberLabel7.text = "+"
        numberLabel7.textColor = .black
        numberLabel7.backgroundColor = .white

        guard let bonusNum = data.bnusNo else { return }
        numberLabel8.text = "\(bonusNum)"
        numberLabel8.backgroundColor = bonusNum.backgroundColor
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var nums: [Int] = []

        for num in 1011...1110 {
            nums.append(num)
        }

        return "\(nums[row])"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        callRequest(number: row + 1011)
    }
}

