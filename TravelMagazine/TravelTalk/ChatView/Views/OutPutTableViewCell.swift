//
//  OutPutTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import UIKit

class OutPutTableViewCell: UITableViewCell {
    @IBOutlet var outputContentView: UIView!
    @IBOutlet var backView: UIView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupBackgroundViewUI()
        setupTimeLabelUI()
        setupContentLabelUI()
    }

    private func setupBackgroundViewUI() {
        outputContentView.backgroundColor = UIColor.chatBackground
        backView.backgroundColor = .clear
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
        contentLabel.backgroundColor = UIColor.outputChatBackground
    }

    func setupData(_ data: Chat) {
        timeLabel.text = data.formattedTime
        contentLabel.text = data.message
    }
}
