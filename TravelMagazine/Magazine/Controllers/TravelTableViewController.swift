//
//  TravelTableViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    var magazineInfoData = MagazineInfo().magazine

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabelViewUI()
    }

    func setupTabelViewUI() {
        tableView.rowHeight = 455
        tableView.separatorStyle = .none
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineInfoData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MagazineTableViewCell.identifier,
            for: indexPath
        ) as? MagazineTableViewCell else {
            return UITableViewCell()
        }

        let data = magazineInfoData[indexPath.row]
        cell.setupData(data)

        return cell
    }
}
