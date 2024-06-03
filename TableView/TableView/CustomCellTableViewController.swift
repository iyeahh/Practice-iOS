//
//  CustomCellTableViewController.swift
//  TableView
//
//  Created by Bora Yang on 5/23/24.
//

import UIKit

enum HeaderView: String, CaseIterable {
    case all = "전체 설정"
    case personal = "개인 설정"
    case etc = "기타"

    var subOptions: [String] {
        switch self {
        case .all:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .etc:
            return ["고객센터/도움말"]
        }
    }
}

class CustomCellTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return HeaderView.allCases[section].rawValue
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return HeaderView.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HeaderView.allCases[section].subOptions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        cell.textLabel?.text = HeaderView.allCases[indexPath.section].subOptions[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        return cell
    }
}
