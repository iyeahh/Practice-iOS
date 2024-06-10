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
        mainLabel.font = .boldSystemFont(ofSize: 21)
    }

    func setupSubLabelUI() {
        subLabel.font = .boldSystemFont(ofSize: 14)
        subLabel.textColor = .gray
    }

    func setupDateLabel() {
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .gray
        dateLabel.textAlignment = .right
    }

    func setupData(_ data : Magazine) {
        mainImageView.kf.setImage(with: data.url)
        mainLabel.text = data.title
        subLabel.text = data.subtitle
        dateLabel.text = data.formattedDate
    }
}
