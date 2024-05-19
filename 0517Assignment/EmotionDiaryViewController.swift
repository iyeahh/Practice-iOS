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
        happyLabel.text = "행복해 1"
        happyLabel.textAlignment = .center

        loveLabel.text = "사랑해 1"
        loveLabel.textAlignment = .center

        likeLabel.text = "좋아해 1"
        likeLabel.textAlignment = .center

        panicLabel.text = "당황해 1"
        panicLabel.textAlignment = .center

        upsetLabel.text = "속상해 1"
        upsetLabel.textAlignment = .center

        depressedLabel.text = "우울해 1"
        depressedLabel.textAlignment = .center

        boredLabel.text = "심심해 1"
        boredLabel.textAlignment = .center

        sulkingLabel.text = "삐졌어 1"
        sulkingLabel.textAlignment = .center

        tearfulLabel.text = "눈물나 1"
        tearfulLabel.textAlignment = .center
    }

    // MARK: - button action 연결
    @IBAction func happyButtonTapped(_ sender: UIButton) {
    }
    @IBAction func loveButtonTapped(_ sender: UIButton) {
    }
    @IBAction func likeButtonTapped(_ sender: UIButton) {
    }
    @IBAction func panicButtonTapped(_ sender: UIButton) {
    }
    @IBAction func upsetButtonTapped(_ sender: UIButton) {
    }
    @IBAction func depressedButtonTapped(_ sender: UIButton) {
    }
    @IBAction func boredButtonTapped(_ sender: UIButton) {
    }
    @IBAction func sulkingButtonTapped(_ sender: UIButton) {
    }
    @IBAction func tearfulButtonTapped(_ sender: UIButton) {
    }
}
