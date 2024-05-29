//
//  TravelDetailViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/29/24.
//

import UIKit

class TravelDetailViewController: UIViewController {
    @IBOutlet var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "관광지 화면"
        mainLabel.text = "관광지 화면"
    }
}
