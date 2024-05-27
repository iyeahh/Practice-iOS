//
//  BannerTableViewCell.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/27/24.
//

import UIKit

final class BannerTableViewCell: UITableViewCell {

    @IBOutlet var backgroundColorView: UIView!
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBackgroundColorViewUI()
        setupAdLabelUI()
        setupMainLabel()
    }

    private func setupBackgroundColorViewUI() {
        backgroundColorView.backgroundColor = .systemPink
        backgroundColorView.layer.cornerRadius = 10
    }

    private func setupAdLabelUI() {
        adLabel.backgroundColor = .white
        adLabel.text = "AD"
        adLabel.font = .systemFont(ofSize: 15)
        adLabel.textAlignment = .center
    }

    private func setupMainLabel() {
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        mainLabel.font = .boldSystemFont(ofSize: 15)
    }
}
