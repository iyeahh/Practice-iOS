//
//  OutPutTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import UIKit

class OutPutTableViewCell: UITableViewCell {

    @IBOutlet var lineView: UIView!
    
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var contentBackgroundView: UIView!
    @IBOutlet var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLineViewUI()
        setupTimeLabelUI()
        setupContentLabelUI()
        setupContentBackgroundViewUI()
    }

    private func setupLineViewUI() {
        lineView.isHidden = true
    }

    private func setupTimeLabelUI() {
        timeLabel.font = UIFont.chatTime
        timeLabel.textColor = UIColor.secondary
        timeLabel.textAlignment = .right
    }

    private func setupContentBackgroundViewUI() {
        contentBackgroundView.layer.cornerRadius = 10
        contentBackgroundView.layer.borderColor = UIColor.natural.cgColor
        contentBackgroundView.layer.borderWidth = 1
        contentBackgroundView.backgroundColor = UIColor.secondary.withAlphaComponent(0.5)
    }

    private func setupContentLabelUI() {
        contentLabel.font = UIFont.chatContent
        contentLabel.textColor = UIColor.primary
        contentLabel.numberOfLines = 0
        contentLabel.textAlignment = .right
    }

    func setupData(_ data: Chat) {
        timeLabel.text = data.formattedTime
        contentLabel.text = data.message
    }
}
