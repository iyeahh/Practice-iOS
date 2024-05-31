//
//  PeopleTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {
    @IBOutlet var profileLabelCollection: [UILabel]!
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
        profileLabelCollection.forEach { label in
            label.layer.cornerRadius = label.frame.width / 2
        }
    }

    private func setupProfileLabel() {
        profileLabelCollection.forEach { label in
            label.textAlignment = .center
            label.font = UIFont.smallProfileImage
            label.backgroundColor = UIColor.natural
            label.clipsToBounds = true
        }
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
        profileLabelCollection.forEach { label in
            label.text = data.chatroomImage[label.tag].firstCharactor
        }
        nameLabel.text = data.chatroomName
        guard let chat = data.chatList.last else {
            return
        }
        dateLabel.text = chat.formattedDate
        contentLabel.text = chat.message
    }
}
