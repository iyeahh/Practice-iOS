//
//  PersonTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupProfileImgeView()
        setupNameLabelUI()
        setupDateLabelUI()
        setupContentLabelUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }

    private func setupProfileImgeView() {
        profileImageView.contentMode = .scaleAspectFill
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
        profileImageView.image = UIImage(named: data.chatroomImage.first!)
        nameLabel.text = data.chatroomName
        guard let chat = data.chatList.last else {
            return
        }
        dateLabel.text = chat.formattedDate
        contentLabel.text = chat.message
    }
}
