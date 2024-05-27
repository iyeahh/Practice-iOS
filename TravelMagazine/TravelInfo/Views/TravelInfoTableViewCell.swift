//
//  TravelInfoTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/27/24.
//

import UIKit

final class TravelInfoTableViewCell: UITableViewCell {
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var starImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupMainLabelUI()
        setupSubLabelUI()
        setupSaveLabelUI()
        setupMainImageViewUI()
        setupLikeButtonUI()
    }

    // TODO: starImageViewLayout

    private func setupMainLabelUI() {
        mainLabel.font = .boldSystemFont(ofSize: 17)
    }

    private func setupSubLabelUI() {
        subLabel.font = .boldSystemFont(ofSize: 15)
        subLabel.textColor = .gray
        subLabel.numberOfLines = 0
    }

    private func setupSaveLabelUI() {
        saveLabel.font = .systemFont(ofSize: 13)
        saveLabel.textColor = .lightGray
    }

    private func setupMainImageViewUI() {
        mainImageView.layer.cornerRadius = 8
        mainImageView.contentMode = .scaleAspectFill
    }

    private func setupLikeButtonUI() {
        likeButton.setTitle("", for: .normal)
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.layer.borderWidth = 1
        likeButton.layer.borderColor = UIColor.white.cgColor
    }
}
