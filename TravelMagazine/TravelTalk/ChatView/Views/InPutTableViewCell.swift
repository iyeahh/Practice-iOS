//
//  InPutTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import UIKit

class InPutTableViewCell: UITableViewCell {
    @IBOutlet var profileLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupProfileLabelUI()
        setupNameLabelUI()
        setupTimeLabelUI()
        setupContentLabelUI()
    }

    private func setupProfileLabelUI() {
        profileLabel.textAlignment = .center
        profileLabel.font = UIFont.smallProfileImage
        profileLabel.backgroundColor = UIColor.natural
        profileLabel.clipsToBounds = true
        profileLabel.layer.cornerRadius = profileLabel.frame.width / 2
    }

    private func setupNameLabelUI() {
        nameLabel.font = UIFont.chatName
    }

    private func setupTimeLabelUI() {
        timeLabel.font = UIFont.chatTime
        timeLabel.textColor = UIColor.secondary
    }

    private func setupContentLabelUI() {
        contentLabel.font = UIFont.chatContent
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.primary
        contentLabel.clipsToBounds = true
        contentLabel.layer.cornerRadius = 5
        contentLabel.layer.borderColor = UIColor.natural.cgColor
        contentLabel.layer.borderWidth = 1
    }

    func setupData(_ data: Chat) {
        profileLabel.text = data.user.profileImage.firstCharactor
        nameLabel.text = data.user.rawValue
        timeLabel.text = data.formattedTime
        contentLabel.text = data.message
    }
}
