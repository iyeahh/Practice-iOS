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
        setupTalkLabelUI()
    }

    private func setupProfileLabel() {
        profileLabel.textAlignment = .center
        profileLabel.font = UIFont.profileImage
        profileLabel.backgroundColor = #colorLiteral(red: 0.6941176471, green: 0.8196078431, blue: 0.5098039216, alpha: 1)
        profileLabel.clipsToBounds = true
        profileLabel.layer.cornerRadius = 30
    }

    private func setupNameLabelUI() {
        nameLabel.font = UIFont.name
    }

    private func setupDateLabelUI() {
        dateLabel.font = UIFont.date
        dateLabel.textColor = .lightGray
    }

    private func setupTalkLabelUI() {
        contentLabel.font = UIFont.content
        contentLabel.textColor = .lightGray
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
