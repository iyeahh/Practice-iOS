//
//  RestaurantListTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import UIKit

class RestaurantListTableViewCell: UITableViewCell {
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCategoryLabelUI()
        setupLikeButtonUI()
        setupMainImageViewUI()
        setupNameLabelUI()
        setupPhoneNumberLabelUI()
        setupAddressLabelUI()
        setupPriceLabelUI()
    }

    func setupCategoryLabelUI() {
        categoryLabel.layer.borderWidth = 1
        categoryLabel.layer.borderColor = UIColor.orange.cgColor
        categoryLabel.layer.masksToBounds = true
        categoryLabel.layer.cornerRadius = 10
        categoryLabel.textAlignment = .center
        categoryLabel.textColor = .orange
        categoryLabel.font = .boldSystemFont(ofSize: 15)
    }

    func setupLikeButtonUI() {
        likeButton.layer.masksToBounds = true
        likeButton.layer.cornerRadius = 10
        likeButton.backgroundColor = .clear
        likeButton.setTitle("", for: .normal)
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = .red
    }

    func setupMainImageViewUI() {
        mainImageView.layer.cornerRadius = 10
        mainImageView.contentMode = .scaleAspectFill
    }

    func setupNameLabelUI() {
        nameLabel.font = .boldSystemFont(ofSize: 15)
        nameLabel.numberOfLines = 0
    }

    func setupPhoneNumberLabelUI() {
        phoneNumberLabel.font = .systemFont(ofSize: 13)
    }

    func setupAddressLabelUI() {
        addressLabel.font = .systemFont(ofSize: 13)
        addressLabel.numberOfLines = 0
    }

    func setupPriceLabelUI() {
        priceLabel.font = .boldSystemFont(ofSize: 13)
    }

    func setData(data: RestaurantInfo) {
        categoryLabel.text = data.category.rawValue
        categoryLabel.textColor = data.labelColor
        categoryLabel.layer.borderColor = data.labelColor.cgColor
        
        mainImageView.kf.setImage(with: data.url)
        nameLabel.text = data.name
        phoneNumberLabel.text = data.phoneNumber
        addressLabel.text = data.address
        priceLabel.text = data.price.formatted()

        let likeButtonImageName = data.like ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: likeButtonImageName), for: .normal)
    }
}
