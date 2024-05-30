//
//  AdvertisementViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/29/24.
//

import UIKit

class AdvertisementViewController: UIViewController {
    @IBOutlet var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        mainLabel.text = "광고 화면"
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
