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
    @IBOutlet var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategoryButtonUI()
        setupPriceButtonUI()
        setupLikeButtonUI()
        tableView.rowHeight = 236
        searchBar.delegate = self
    }

    func setupCategoryButtonUI() {
        setupButtonsUI(categoryButton)
        setbuttonImage(categoryButton, name: "list.bullet")
        categoryButton.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
    }

    func setupPriceButtonUI() {
        setupButtonsUI(priceButton)
        setbuttonImage(priceButton, name: "wonsign")
        priceButton.addTarget(self, action: #selector(priceButtonTapped), for: .touchUpInside)
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

    @objc func priceButtonTapped() {
        let actionSheet = UIAlertController(title: "가격 설정", message: nil, preferredStyle: .actionSheet)

        actionSheet.addAction(UIAlertAction(title: "1만원 이하", style: .default, handler: { _ in
            self.restaurantViewModel.getPriceRetaurantList(price: 10000)
            self.tableView.reloadData()
        }))

        actionSheet.addAction(UIAlertAction(title: "2만원 이하", style: .default, handler: { _ in
            self.restaurantViewModel.getPriceRetaurantList(price: 20000)
            self.tableView.reloadData()
        }))

        actionSheet.addAction(UIAlertAction(title: "3만원 이하", style: .default, handler: { _ in
            self.restaurantViewModel.getPriceRetaurantList(price: 30000)
            self.tableView.reloadData()
        }))

        actionSheet.addAction(UIAlertAction(title: "모두 보기", style: .default, handler: { _ in
            self.restaurantViewModel.getPriceRetaurantList(price: 0)
            self.tableView.reloadData()
        }))

        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))

        self.present(actionSheet, animated: true, completion: nil)
    }

    @objc func favoriteButtonTapped() {
        restaurantViewModel.getLikeRestaurantList()
        tableView.reloadData()
    }

    @objc func likeButtonTapped(_ sender: UIButton) {
        restaurantViewModel.filteredList[sender.tag].like.toggle()
        restaurantViewModel.changeLikeStatus(index: sender.tag)
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let like = UIContextualAction(style: .normal, title: "Like") { [self] (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            self.restaurantViewModel.filteredList[indexPath.row].like.toggle()
            restaurantViewModel.changeLikeStatus(index: indexPath.row)
            tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .none)
            success(true)
        }
        like.backgroundColor = .red
        like.image = UIImage(systemName: "hand.thumbsup")
        like.title = nil

        return UISwipeActionsConfiguration(actions:[like])
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

        let data = restaurantViewModel.filteredList[indexPath.row]

        cell.setData(data: data)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)

        return cell
    }
}

extension RestaurantListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        restaurantViewModel.searchRestaurant(word: searchBar.text!)
        tableView.reloadData()
    }
}

extension RestaurantListTableViewController: ViewControllerDelegate {
    func dismissViewController(data: String) {
        restaurantViewModel.getCategoryRestaurantList(category: data)
        tableView.reloadData()
    }
}
