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
        navigationItem.title = "광고 화면"
        navigationItem.leftBarButtonItem?.tintColor = .black
        mainLabel.text = "광고 화면"
    }

    @IBAction func dismissButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
