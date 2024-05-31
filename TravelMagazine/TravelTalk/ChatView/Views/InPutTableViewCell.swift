//
//  InPutTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import UIKit

class InPutTableViewCell: UITableViewCell {
    @IBOutlet var inputContentView: UIView!
    @IBOutlet var backView: UIView!
    @IBOutlet var profileLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupBackgroundViewUI()
        setupProfileLabelUI()
        setupNameLabelUI()
        setupTimeLabelUI()
        setupContentLabelUI()
    }

    private func setupBackgroundViewUI() {
        inputContentView.backgroundColor = UIColor.chatBackground
        backView.backgroundColor = UIColor.clear
    }

    private func setupProfileLabelUI() {
        profileLabel.textAlignment = .center
        profileLabel.font = UIFont.smallProfileImage
        profileLabel.backgroundColor = #colorLiteral(red: 0.6941176471, green: 0.8196078431, blue: 0.5098039216, alpha: 1)
        profileLabel.clipsToBounds = true
        profileLabel.layer.cornerRadius = 5
    }

    private func setupNameLabelUI() {
        nameLabel.font = UIFont.chatName
        nameLabel.textColor = UIColor.profileBackground
        nameLabel.backgroundColor = .clear
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
        contentLabel.backgroundColor = .white
    }

    func setupData(_ data: Chat) {
        profileLabel.text = data.user.profileImage
        nameLabel.text = data.user.rawValue
        timeLabel.text = data.formattedTime
        contentLabel.text = data.message
    }
}
