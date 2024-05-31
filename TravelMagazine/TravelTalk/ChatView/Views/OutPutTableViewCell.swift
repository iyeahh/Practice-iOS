//
//  OutPutTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import UIKit

class OutPutTableViewCell: UITableViewCell {
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupTimeLabelUI()
        setupContentLabelUI()
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }

    private func setupTimeLabelUI() {
        timeLabel.font = UIFont.chatTime
        timeLabel.textColor = UIColor.secondary
        timeLabel.textAlignment = .right
    }

    private func setupContentLabelUI() {
        contentLabel.font = UIFont.chatContent
        contentLabel.textColor = UIColor.primary
        contentLabel.numberOfLines = 0
        contentLabel.textAlignment = .right
        contentLabel.clipsToBounds = true
        contentLabel.layer.cornerRadius = 5
        contentLabel.backgroundColor = UIColor.natural
        contentLabel.layer.borderColor = UIColor.primary.cgColor
        contentLabel.layer.borderWidth = 1
    }

    func setupData(_ data: Chat) {
        timeLabel.text = data.formattedTime
        contentLabel.text = data.message
    }
}
