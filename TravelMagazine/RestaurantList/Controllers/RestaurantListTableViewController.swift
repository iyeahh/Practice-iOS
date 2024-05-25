//
//  RestaurantListTableViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import UIKit

class RestaurantListTableViewController: UITableViewController {
    var restaurantListData = RestaurantList().restaurantArray
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonsUI()
        tableView.rowHeight = 236
    }

    func setupButtonsUI() {
        buttonCollection.forEach { button in
            button.layer.masksToBounds = true
            button.layer.cornerRadius = 10
            button.titleLabel?.textColor = .black
            button.tintColor = .black
            button.backgroundColor = #colorLiteral(red: 0.8980388045, green: 0.8980395198, blue: 0.9152473807, alpha: 1)

            switch button.tag {
            case 0:
                setbuttonImage(button, name: "list.bullet")
            case 1:
                setbuttonImage(button, name: "wonsign")
            case 2:
                setbuttonImage(button, name: "heart.fill")
            default:
                setbuttonImage(button, name: "star.fill")
            }
        }
    }

    func setbuttonImage(
        _ button: UIButton,
        name: String
    ) {
        button.setImage(
            UIImage(systemName: "\(name)"),
            for: .normal)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantListData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "RestaurantListTableViewCell",
            for: indexPath
        ) as? RestaurantListTableViewCell else {
            return UITableViewCell()
        }

        let data = restaurantListData[indexPath.row]

        cell.categoryLabel.text = data.category
        cell.mainImageView.kf.setImage(with: data.url)
        cell.nameLabel.text = data.name
        cell.phoneNumberLabel.text = data.phoneNumber
        cell.addressLabel.text = data.address
        cell.priceLabel.text = "\(data.price)"

        return cell
    }
}
