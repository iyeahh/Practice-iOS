//
//  CategoryViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/26/24.
//

import UIKit

class CategoryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let categorys = Category.categorys
    var choiceCategory: String = "All"
    weak var delegate: ViewControllerDelegate?

    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var confimButton: UIButton!
    @IBOutlet var categoryPickerView: UIPickerView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategoryLabelUI()
        setupConfirmButtonUI()
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
    }

    func setupCategoryLabelUI() {
        categoryLabel.text = "카테고리를 선택하세요"
        categoryLabel.font = .boldSystemFont(ofSize: 17)
    }

    func setupConfirmButtonUI() {
        confimButton.layer.masksToBounds = true
        confimButton.layer.cornerRadius = 10
        confimButton.backgroundColor = .lightGray
        confimButton.setTitle("확인", for: .normal)
        confimButton.setTitleColor(.black, for: .normal)
        confimButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }

    @objc func confirmButtonTapped() {
        delegate?.dismissViewController(data: choiceCategory)
        dismiss(animated: true)
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorys.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorys[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            choiceCategory = categorys[row]
       }
}
