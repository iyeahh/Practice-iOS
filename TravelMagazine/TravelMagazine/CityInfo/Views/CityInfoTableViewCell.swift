//
//  CityInfoTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/29/24.
//

import UIKit

class CityInfoTableViewCell: UITableViewCell {
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var labelBackgroundView: UIView!
    @IBOutlet var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupBackgroundImageViewUI()
        setupCityNameLabelUI()
        setupLabelBackgroundView()
        setupDescriptionLabel()
    }

    private func setupBackgroundImageViewUI() {
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.layer.cornerRadius = 20
        backgroundImageView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMaxYCorner)
    }

    private func setupCityNameLabelUI() {
        cityNameLabel.textAlignment = .right
        cityNameLabel.textColor = .white
        cityNameLabel.font = .boldSystemFont(ofSize: 20)
    }

    private func setupLabelBackgroundView() {
        labelBackgroundView.backgroundColor = .black.withAlphaComponent(0.5)
        labelBackgroundView.layer.masksToBounds = true
        labelBackgroundView.layer.cornerRadius = 20
        labelBackgroundView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMaxYCorner)
    }

    private func setupDescriptionLabel() {
        descriptionLabel.textColor = .white
        descriptionLabel.font = .boldSystemFont(ofSize: 13)
    }

    func setupData(_ data: City, text: String) {
        backgroundImageView.kf.setImage(with: data.url, placeholder: UIImage(systemName: "gear"))
        cityNameLabel.text = data.cityName
        descriptionLabel.text = data.city_explain

        if text != "" {
            changeTextColor(data: data, text: text)
        }
    }

    func changeTextColor(data: City, text: String) {
        let lowercasedText = text.lowercased()

        if data.city_name.contains(text) {
            cityNameLabel.asColor(targetString: text, color: .red)
        }
        if (data.city_english_name).lowercased().contains(lowercasedText) {
            cityNameLabel.asColor(targetString: lowercasedText, color: .red)
        }
        if data.city_explain.contains(text) {
            descriptionLabel.asColor(targetString: text, color: .red)
        }
    }
}
