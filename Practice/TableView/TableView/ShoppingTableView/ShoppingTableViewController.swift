//
//  ShoppingTableViewController.swift
//  TableView
//
//  Created by Bora Yang on 5/24/24.
//

import UIKit

struct ShoppingItem {
    var check: Bool = false
    var item: String
    var like: Bool = false
}

class ShoppingTableViewController: UITableViewController {
    var shoppingList = [
        ShoppingItem(check: true, item: "그립톡 구매하기", like: true),
        ShoppingItem(check: false, item: "사이다 구매", like: false),
        ShoppingItem(check: false, item: "아이패드 케이스 최저가 알아보기", like: true),
        ShoppingItem(check: false, item: "양말", like: true)
    ]

    @IBOutlet var shoppingTitleLabel: UILabel!
    @IBOutlet var backgroundGrayView: UIView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var searchTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupShoppingTitleLabelUI()
        setupBackgroundGrayViewUI()
        setupAddButtonUI()
        setupSearchTextFieldUI()
        tableView.rowHeight = 60
    }

    func setupShoppingTitleLabelUI() {
        shoppingTitleLabel.text = "쇼핑"
        shoppingTitleLabel.font = UIFont.boldSystemFont(ofSize: 17)
    }

    func setupBackgroundGrayViewUI() {
        backgroundGrayView.backgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)
        backgroundGrayView.layer.cornerRadius = 8
    }

    func setupAddButtonUI() {
        addButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = 5
        addButton.setTitle("추가", for: .normal)
        addButton.backgroundColor = #colorLiteral(red: 0.8980388045, green: 0.8980395198, blue: 0.9152473807, alpha: 1)
        addButton.tintColor = .black
    }

    func setupSearchTextFieldUI() {
        searchTextField.placeholder = "무엇을 구매하실 건가요?"
        searchTextField.backgroundColor = .clear
        searchTextField.borderStyle = .none
    }

    @objc func checkboxButtonTapped(sender: UIButton) {
        shoppingList[sender.tag].check.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }

    @objc func likeButtonTapped(sender: UIButton) {
        shoppingList[sender.tag].like.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as? ShoppingTableViewCell else {
            return UITableViewCell()
        }

        let data = shoppingList[indexPath.row]

        cell.backgroundGrayView.backgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)
        cell.backgroundGrayView.layer.cornerRadius = 8

        cell.listLabel.text = data.item
        cell.listLabel.font = .systemFont(ofSize: 15)

        let checkButtonImageName = data.check ? "checkmark.square.fill" : "checkmark.square"
        cell.checkboxButton.setImage(UIImage(systemName: checkButtonImageName), for: .normal)
        cell.checkboxButton.setTitle("", for: .normal)
        cell.checkboxButton.tintColor = .black
        cell.checkboxButton.tag = indexPath.row
        cell.checkboxButton.addTarget(self, action: #selector(checkboxButtonTapped), for: .touchUpInside)

        let likeButtonImageName = data.like ? "star.fill" : "star"
        cell.likeButton.setImage(UIImage(systemName: likeButtonImageName), for: .normal)
        cell.likeButton.setTitle("", for: .normal)
        cell.likeButton.tintColor = .black
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)

        return cell
    }
}
