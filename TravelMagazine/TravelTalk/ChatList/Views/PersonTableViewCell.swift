//
//  PersonTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet var profileLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupProfileLabel()
        setupNameLabelUI()
        setupDateLabelUI()
        setupContentLabelUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        profileLabel.layer.cornerRadius = profileLabel.frame.width / 2
    }

    private func setupProfileLabel() {
        profileLabel.textAlignment = .center
        profileLabel.font = UIFont.profileImage
        profileLabel.backgroundColor = UIColor.natural
        profileLabel.clipsToBounds = true
        profileLabel.layer.cornerRadius = 30
    }

    private func setupNameLabelUI() {
        nameLabel.font = UIFont.name
    }

    private func setupDateLabelUI() {
        dateLabel.font = UIFont.date
        dateLabel.textColor = UIColor.secondary
        dateLabel.textAlignment = .right
    }

    private func setupContentLabelUI() {
        contentLabel.font = UIFont.content
        contentLabel.textColor = UIColor.secondary
    }

    func setupData(_ data: ChatRoom) {
        profileLabel.text = data.chatroomImage[0].firstCharactor
        nameLabel.text = data.chatroomName
        guard let chat = data.chatList.last else {
            return
        }
        dateLabel.text = chat.formattedDate
        contentLabel.text = chat.message
    }
}
