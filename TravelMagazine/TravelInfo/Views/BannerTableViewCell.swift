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

    var backgroundColors = [#colorLiteral(red: 1, green: 0.8288480639, blue: 0.8279682994, alpha: 1), #colorLiteral(red: 0.8388726115, green: 1, blue: 0.8289427161, alpha: 1)]

    override func awakeFromNib() {
        super.awakeFromNib()
        setupBackgroundColorViewUI()
        setupAdLabelUI()
        setupMainLabel()
    }

    private func setupBackgroundColorViewUI() {
        backgroundColorView.backgroundColor = backgroundColors.randomElement()
        backgroundColorView.layer.cornerRadius = 10
    }

    private func setupAdLabelUI() {
        adLabel.backgroundColor = .white
        adLabel.layer.masksToBounds = true
        adLabel.layer.cornerRadius = 5
        adLabel.text = "AD"
        adLabel.font = .boldSystemFont(ofSize: 13)
        adLabel.textAlignment = .center
    }

    private func setupMainLabel() {
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        mainLabel.font = .systemFont(ofSize: 15, weight: .heavy)
    }

    func setupData(_ data: Travel) {
        backgroundColorView.backgroundColor = backgroundColors.randomElement()
        mainLabel.text = data.title
    }
}
