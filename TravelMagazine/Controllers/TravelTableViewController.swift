//
//  TravelTableViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import UIKit

class TravelTableViewController: UITableViewController {
    var dummy = [
        Magazine(title: "파리", subtitle: "파리여행", photo_image: "", date: "22년 1월 1일", link: ""),
        Magazine(title: "파리", subtitle: "파리여행", photo_image: "", date: "22년 1월 1일", link: ""),
        Magazine(title: "파리", subtitle: "파리여행", photo_image: "", date: "22년 1월 1일", link: "")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 475
        tableView.separatorStyle = .none
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dummy.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "MagazineTableViewCell",
            for: indexPath
        ) as? MagazineTableViewCell else {
            return UITableViewCell()
        }

        let data = dummy[indexPath.row]

        cell.mainImageView.image = UIImage(systemName: "star")
        cell.mainImageView.backgroundColor = .gray
        cell.mainLabel.text = data.title
        cell.subLabel.text = data.subtitle
        cell.dateLabel.text = data.date

        return cell
    }
}
