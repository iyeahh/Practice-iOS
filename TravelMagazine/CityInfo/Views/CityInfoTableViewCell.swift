//
//  CityInfoTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/29/24.
//

import UIKit

class CityInfoTableViewCell: UITableViewCell {
    static let identifier = "CityInfoTableViewCell"

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
    }

    private func setupCityNameLabelUI() {
        cityNameLabel.textAlignment = .right
        cityNameLabel.textColor = .white
        cityNameLabel.font = .boldSystemFont(ofSize: 22)
    }

    private func setupLabelBackgroundView() {
        labelBackgroundView.backgroundColor = .black.withAlphaComponent(0.3)
    }

    private func setupDescriptionLabel() {
        descriptionLabel.textColor = .white
    }

    func setupData(_ data: City) {
        backgroundImageView.kf.setImage(with: data.url)
        cityNameLabel.text = data.cityName
        descriptionLabel.text = data.city_explain
    }
}
