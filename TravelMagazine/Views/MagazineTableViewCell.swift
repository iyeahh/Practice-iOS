//
//  MagazineTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import UIKit

class MagazineTableViewCell: UITableViewCell {
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupMainImageViewUI()
        setupMainLabelUI()
        setupSubLabelUI()
        setupDateLabel()
    }

    func setupMainImageViewUI() {
        mainImageView.layer.cornerRadius = 8
        mainImageView.contentMode = .scaleAspectFill
    }

    func setupMainLabelUI() {
        mainLabel.font = .boldSystemFont(ofSize: 22)
    }

    func setupSubLabelUI() {
        subLabel.font = .boldSystemFont(ofSize: 15)
        subLabel.textColor = .gray
    }

    func setupDateLabel() {
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textColor = .gray
        dateLabel.textAlignment = .right
    }
}
