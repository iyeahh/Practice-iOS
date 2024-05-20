//
//  EmotionDiaryViewController.swift
//  0517Assignment
//
//  Created by Bora Yang on 5/19/24.
//

import UIKit

class EmotionDiaryViewController: UIViewController {

    // MARK: - OutletCollection 연결
    @IBOutlet var buttonOutletCollection: [UIButton]!

    @IBOutlet var labelOutletCollection: [UILabel]!

    var numberCount = [1, 1, 1, 1, 1, 1, 1, 1, 1]

    var emotion = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "삐졌어", "눈물나"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8609215617, green: 0.8262683749, blue: 0.7879908681, alpha: 1)
        setupButtonImage()
        setupLableText()
    }

    func setupButtonImage() {
        var num = 1

        buttonOutletCollection.forEach {
            $0.setImage(UIImage(named: "slime\(num)"), for: .normal)
            num += 1
        }
    }

    // tag 활용
    func setupLableText() {
        labelOutletCollection.forEach { label in
            label.textAlignment = .center
            label.text = "\(emotion[label.tag]) \(numberCount[label.tag])"
        }
    }

    // MARK: - button action 한 번에 연결
    @IBAction func buttonTapped(_ sender: UIButton) {
        numberCount[sender.tag] += 1
        labelOutletCollection[sender.tag].text = "\(emotion[sender.tag]) \(numberCount[sender.tag])"
    }
}
