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

    private func setupProfileLabel() {
        profileLabel.textAlignment = .center
        profileLabel.font = UIFont.profileImage
        profileLabel.backgroundColor = UIColor.profileBackground
        profileLabel.clipsToBounds = true
        profileLabel.layer.cornerRadius = 30
    }

    private func setupNameLabelUI() {
        nameLabel.font = UIFont.name
    }

    private func setupDateLabelUI() {
        dateLabel.font = UIFont.date
        dateLabel.textColor = UIColor.secondary
    }

    private func setupContentLabelUI() {
        contentLabel.font = UIFont.content
        contentLabel.textColor = UIColor.secondary
        contentLabel.numberOfLines = 2
    }

    func setupData(_ data: ChatRoom) {
        profileLabel.text = data.chatroomImage[0]
        nameLabel.text = data.chatroomName
        guard let chat = data.chatList.last else {
            return
        }
        dateLabel.text = chat.formattedDate
        contentLabel.text = chat.message
    }
}
