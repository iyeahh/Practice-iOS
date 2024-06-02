//
//  PeopleTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet var profileImageViewCollection: [UIImageView]!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupProfileImageViewCollectionUI()
        setupNameLabelUI()
        setupDateLabelUI()
        setupContentLabelUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageViewCollection.forEach { imageView in
            imageView.layer.cornerRadius = imageView.frame.width / 2
        }
    }

    private func setupProfileImageViewCollectionUI() {
        profileImageViewCollection.forEach { imageView in
            imageView.contentMode = .scaleAspectFill
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
        profileImageViewCollection.forEach { imageView in
            let image = data.chatroomImage[imageView.tag]
            imageView.image = UIImage(named: image)
        }
        nameLabel.text = data.chatroomName
        guard let chat = data.chatList.last else {
            return
        }
        dateLabel.text = chat.formattedDate
        contentLabel.text = chat.message
    }
}
