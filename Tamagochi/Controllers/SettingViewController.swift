//
//  SettingViewController.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/8/24.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController {
    let tableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureHeierarchy()
        configureLayout()
        configureTableView()
    }

    private func configureUI() {
        navigationItem.title = "설정"
        let button = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = button
        view.backgroundColor = .primary
    }

    private func configureHeierarchy() {
        view.addSubview(tableView)
    }

    private func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        switch indexPath.row {
        case 0 :
            cell.imageView?.image = .pencil
            cell.textLabel?.text = "내 이름 설정하기"
            cell.detailTextLabel?.text = UserDefaultManager.nickname
        case 1:
            cell.imageView?.image = .moon
            cell.textLabel?.text = "다마고치 변경하기"
        default:
            cell.imageView?.image = .reset
            cell.textLabel?.text = "데이터 초기화"
        }
        cell.imageView?.contentMode = .scaleAspectFit
        cell.tintColor = .secondary
        cell.textLabel?.textColor = .secondary
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            let vc = RenameViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = ChoiceViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            presentAlert()
        }
    }

    private func presentAlert() {
        let alert = UIAlertController(
            title: "데이터 초기화",
            message: "정말 다시 처음부터 시작하실건가용?",
            preferredStyle: .alert)

        let yes = UIAlertAction(
            title: "웅",
            style: .default,
            handler: { _ in
                self.resetData()
            })

        let cancel = UIAlertAction(
            title: "아냐!",
            style: .cancel,
            handler: nil)

        alert.addAction(yes)
        alert.addAction(cancel)

        present(alert, animated: true)
    }

    private func resetData() {
        UserDefaultManager.nickname = "대장님"
        UserDefaultManager.waterCount = 0
        UserDefaultManager.riceCount = 0
        UserDefaultManager.character = "twinkle"
        UserDefaultManager.isSelected = false

        let vc = UINavigationController(rootViewController: ChoiceViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
