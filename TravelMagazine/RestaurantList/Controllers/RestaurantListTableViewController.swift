//
//  RestaurantListTableViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func dismissViewController(data: String)
}

class RestaurantListTableViewController: UITableViewController {
    var restaurantViewModel = RestaurantViewModel()

    @IBOutlet var categoryButton: UIButton!
    @IBOutlet var priceButton: UIButton!
    @IBOutlet var favoriteButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategoryButtonUI()
        setupPriceButtonUI()
        setupLikeButtonUI()
        tableView.rowHeight = 236

    }

    func setupCategoryButtonUI() {
        setupButtonsUI(categoryButton)
        setbuttonImage(categoryButton, name: "list.bullet")
        categoryButton.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
    }

    func setupPriceButtonUI() {
        setupButtonsUI(priceButton)
        setbuttonImage(priceButton, name: "wonsign")
    }

    func setupLikeButtonUI() {
        setupButtonsUI(favoriteButton)
        setbuttonImage(favoriteButton, name: "heart.fill")
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
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

    @objc func categoryButtonTapped() {
        guard let categoryVC = storyboard?.instantiateViewController(withIdentifier: "categoryVC") as? CategoryViewController else { return }
        if let sheet = categoryVC.sheetPresentationController {
            sheet.detents = [
                .custom { _ in
                    return 300
                }
            ]
        }
        categoryVC.delegate = self
        present(categoryVC, animated: true)
    }

    @objc func favoriteButtonTapped() {
        restaurantViewModel.getLikeRestaurantList()
        tableView.reloadData()
    }

    @objc func likeButtonTapped(_ sender: UIButton) {
        restaurantViewModel.restaurantListData[sender.tag].like.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurantViewModel.restaurantCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "RestaurantListTableViewCell",
            for: indexPath
        ) as? RestaurantListTableViewCell else {
            return UITableViewCell()
        }

        let data = restaurantViewModel.restaurantListData[indexPath.row]

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

extension RestaurantListTableViewController: ViewControllerDelegate {
    func dismissViewController(data: String) {
        restaurantViewModel.getCategoryRestaurantList(category: data)
        tableView.reloadData()
    }
}
