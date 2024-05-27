//
//  TravelInfoViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/27/24.
//

import UIKit
import Kingfisher

class TravelInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var travelInfo = TravelInfo().travel

    @IBOutlet var travelTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        registerXIB()
    }

    private func setupTableView() {
        travelTableView.delegate = self
        travelTableView.dataSource = self
    }

    private func registerXIB() {
        let xib = UINib(nibName: "TravelInfoTableViewCell", bundle: nil)
        travelTableView.register(xib, forCellReuseIdentifier: "TravelInfoTableViewCell")

        let xib2 = UINib(nibName: "BannerTableViewCell", bundle: nil)
        travelTableView.register(xib2, forCellReuseIdentifier: "BannerTableViewCell")
    }

    @objc private func likeButtonTapped(_ sender: UIButton) {
        travelInfo[sender.tag].like?.toggle()
        travelTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if travelInfo[indexPath.row].ad {
            return 100
        } else {
            return 150
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = travelInfo[indexPath.row]

        if data.ad {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as? BannerTableViewCell else {
                return UITableViewCell()
            }
            cell.setupData(data)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TravelInfoTableViewCell", for: indexPath) as? TravelInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.setupData(data)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            return cell
        }
    }
}
