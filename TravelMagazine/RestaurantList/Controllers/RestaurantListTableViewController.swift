//
//  RestaurantListTableViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import UIKit

class RestaurantListTableViewController: UITableViewController {
    var restaurantViewModel = RestaurantViewModel()

    var isFavoriteButtonTapped: Bool = false
    var favoriteRestaurantList: [RestaurantInfo] = []

    @IBOutlet var categoryButton: UIButton!
    @IBOutlet var priceButton: UIButton!
    @IBOutlet var favoriteButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategoryButtonUI()
        setupPriceButtonUI()
        setupLikeButtonUI()
        tableView.rowHeight = 236
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }

    func setupCategoryButtonUI() {
        setupButtonsUI(categoryButton)
        setbuttonImage(categoryButton, name: "list.bullet")
    }

    func setupPriceButtonUI() {
        setupButtonsUI(priceButton)
        setbuttonImage(priceButton, name: "wonsign")
    }

    func setupLikeButtonUI() {
        setupButtonsUI(favoriteButton)
        setbuttonImage(favoriteButton, name: "heart.fill")
    }

    func setupButtonsUI(_ button: UIButton) {
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = .black
        button.tintColor = .black
        button.backgroundColor = #colorLiteral(red: 0.8980388045, green: 0.8980395198, blue: 0.9152473807, alpha: 1)
    }

    func setbuttonImage(
        _ button: UIButton,
        name: String
    ) {
        button.setImage(
            UIImage(systemName: "\(name)"),
            for: .normal)
    }

    @objc func favoriteButtonTapped() {
        isFavoriteButtonTapped.toggle()

        if isFavoriteButtonTapped {
            let array = restaurantViewModel.restaurantListData.filter { restaurantInfo in
                restaurantInfo.like == true
            }
            favoriteRestaurantList = array
        } else {

        }
        tableView.reloadData()
    }

    @objc func likeButtonTapped(_ sender: UIButton) {
        restaurantViewModel.restaurantListData[sender.tag].like.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFavoriteButtonTapped ? favoriteRestaurantList.count : restaurantViewModel.restaurantCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "RestaurantListTableViewCell",
            for: indexPath
        ) as? RestaurantListTableViewCell else {
            return UITableViewCell()
        }

        let data = isFavoriteButtonTapped ? favoriteRestaurantList[indexPath.row] : restaurantViewModel.restaurantListData[indexPath.row]

        cell.categoryLabel.text = data.category.rawValue
        cell.categoryLabel.textColor = data.labelColor
        cell.categoryLabel.layer.borderColor = data.labelColor.cgColor
        cell.mainImageView.kf.setImage(with: data.url)
        cell.nameLabel.text = data.name
        cell.phoneNumberLabel.text = data.phoneNumber
        cell.addressLabel.text = data.address
        cell.priceLabel.text = "\(data.price)"

        let likeButtonImageName = data.like ? "heart.fill" : "heart"
        setbuttonImage(cell.likeButton, name: likeButtonImageName)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)

        return cell
    }
}
