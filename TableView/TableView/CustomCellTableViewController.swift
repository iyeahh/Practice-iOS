//
//  CustomCellTableViewController.swift
//  TableView
//
//  Created by Bora Yang on 5/23/24.
//

import UIKit

class CustomCellTableViewController: UITableViewController {
    let headerString = ["전체 설정", "개인 설정", "기타"]
    let value = [["공지사항", "실험실", "버전 정보"], ["개인/보안", "알림", "채팅", "멀티프로필"], ["고객센터/도움말"]]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerString[section]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return value.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return value[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        cell.textLabel?.text = value[indexPath.section][indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        return cell
    }
}
