//
//  AdvertisementViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/29/24.
//

import UIKit

class AdvertisementViewController: UIViewController {
    @IBOutlet var mainLabel: UILabel!
    var travel: Travel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        guard let travel = travel else { return }
        mainLabel.text = travel.title
    }

    private func setupNavigationItem() {
        navigationItem.title = "광고 화면"

        let dismissButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dimissButtonTapped))
        navigationItem.leftBarButtonItem = dismissButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    }

    @objc func dimissButtonTapped() {
        dismiss(animated: true)
    }
}
