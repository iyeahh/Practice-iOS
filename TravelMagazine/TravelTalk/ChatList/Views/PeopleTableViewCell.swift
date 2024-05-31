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
        setupTalkLabelUI()
    }

    private func setupProfileLabel() {
        profileLabelCollection.forEach { label in
            label.textAlignment = .center
            label.font = UIFont.smallProfileImage
            label.backgroundColor = #colorLiteral(red: 0.4078431373, green: 0.5607843137, blue: 0.2588235294, alpha: 1)
            label.clipsToBounds = true
            label.layer.cornerRadius = 30
        }
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
        profileLabelCollection[0].text = data.chatroomImage[0]
        profileLabelCollection[1].text = data.chatroomImage[1]
        profileLabelCollection[2].text = data.chatroomImage[2]
        profileLabelCollection[3].text = data.chatroomImage[3]
        nameLabel.text = data.chatroomName
        guard let chat = data.chatList.last else {
            return
        }
        dateLabel.text = chat.formattedDate
        contentLabel.text = chat.message
    }
}
