//
//  InPutTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import UIKit

class InPutTableViewCell: UITableViewCell {
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contentBackgroundView: UIView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupProfileImageViewUI()
        setupNameLabelUI()
        setupTimeLabelUI()
        setupContentBackgroundViewUI()
        setupContentLabelUI()
    }

    private func setupProfileImageViewUI() {
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }

    private func setupNameLabelUI() {
        nameLabel.font = UIFont.chatName
    }

    private func setupTimeLabelUI() {
        timeLabel.font = UIFont.chatTime
        timeLabel.textColor = UIColor.secondary
    }

    private func setupContentBackgroundViewUI() {
        contentBackgroundView.layer.cornerRadius = 10
        contentBackgroundView.layer.borderColor = UIColor.natural.cgColor
        contentBackgroundView.layer.borderWidth = 1
    }

    private func setupContentLabelUI() {
        contentLabel.font = UIFont.chatContent
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.primary
    }

    func setupData(_ data: Chat) {
        profileImageView.image = UIImage(named: data.user.profileImage)
        nameLabel.text = data.user.rawValue
        timeLabel.text = data.formattedTime
        contentLabel.text = data.message
    }
}
