//
//  EmotionDiaryViewController.swift
//  0517Assignment
//
//  Created by Bora Yang on 5/19/24.
//

import UIKit

class EmotionDiaryViewController: UIViewController {

    // MARK: - button outlet 연결
    @IBOutlet var happyButton: UIButton!
    @IBOutlet var loveButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var panicButton: UIButton!
    @IBOutlet var upsetButton: UIButton!
    @IBOutlet var depressedButton: UIButton!
    @IBOutlet var boredButton: UIButton!
    @IBOutlet var sulkingButton: UIButton!
    @IBOutlet var tearfulButton: UIButton!

    // MARK: - label outlet 연결
    @IBOutlet var happyLabel: UILabel!
    @IBOutlet var loveLabel: UILabel!
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var panicLabel: UILabel!
    @IBOutlet var upsetLabel: UILabel!
    @IBOutlet var depressedLabel: UILabel!
    @IBOutlet var boredLabel: UILabel!
    @IBOutlet var sulkingLabel: UILabel!
    @IBOutlet var tearfulLabel: UILabel!

    var happyNumber = 1
    var loveNumber = 1
    var likeNumber = 1
    var panicNumber = 1
    var upsetNumber = 1
    var depressedNumber = 1
    var boredNumber = 1
    var sulkingNumber = 1
    var tearfulNumber = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8609215617, green: 0.8262683749, blue: 0.7879908681, alpha: 1)
        setupButtonImage()
        setupLableText()
    }

    func setupButtonImage() {
        var buttons = [happyButton, loveButton, likeButton, panicButton, upsetButton, depressedButton, boredButton, sulkingButton, tearfulButton]
        var num = 1

        buttons.forEach {
            $0?.setImage(UIImage(named: "slime\(num)"), for: .normal)
            happyButton.contentMode = .scaleAspectFit
            num += 1
        }
    }

    func setupLableText() {
        happyLabel.text = "행복해 \(happyNumber)"
        happyLabel.textAlignment = .center

        loveLabel.text = "사랑해 \(loveNumber)"
        loveLabel.textAlignment = .center

        likeLabel.text = "좋아해 \(likeNumber)"
        likeLabel.textAlignment = .center

        panicLabel.text = "당황해 \(panicNumber)"
        panicLabel.textAlignment = .center

        upsetLabel.text = "속상해 \(upsetNumber)"
        upsetLabel.textAlignment = .center

        depressedLabel.text = "우울해 \(depressedNumber)"
        depressedLabel.textAlignment = .center

        boredLabel.text = "심심해 \(boredNumber)"
        boredLabel.textAlignment = .center

        sulkingLabel.text = "삐졌어 \(sulkingNumber)"
        sulkingLabel.textAlignment = .center

        tearfulLabel.text = "눈물나 \(tearfulNumber)"
        tearfulLabel.textAlignment = .center
    }

    // MARK: - button action 연결
    @IBAction func happyButtonTapped(_ sender: UIButton) {
        happyNumber += 1
        happyLabel.text = "행복해 \(happyNumber)"
    }
    @IBAction func loveButtonTapped(_ sender: UIButton) {
        loveNumber += 1
        loveLabel.text = "사랑해 \(loveNumber)"
    }
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        likeNumber += 1
        likeLabel.text = "좋아해 \(likeNumber)"
    }
    @IBAction func panicButtonTapped(_ sender: UIButton) {
        panicNumber += 1
        panicLabel.text = "당황해 \(panicNumber)"
    }
    @IBAction func upsetButtonTapped(_ sender: UIButton) {
        upsetNumber += 1
        upsetLabel.text = "속상해 \(upsetNumber)"
    }
    @IBAction func depressedButtonTapped(_ sender: UIButton) {
        depressedNumber += 1
        depressedLabel.text = "우울해 \(depressedNumber)"
    }
    @IBAction func boredButtonTapped(_ sender: UIButton) {
        boredNumber += 1
        boredLabel.text = "심심해 \(boredNumber)"
    }
    @IBAction func sulkingButtonTapped(_ sender: UIButton) {
        sulkingNumber += 1
        sulkingLabel.text = "삐졌어 \(sulkingNumber)"
    }
    @IBAction func tearfulButtonTapped(_ sender: UIButton) {
        tearfulNumber += 1
        tearfulLabel.text = "눈물나 \(tearfulNumber)"
    }
}
