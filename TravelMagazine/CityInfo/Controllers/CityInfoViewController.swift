//
//  CityInfoViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/29/24.
//

import UIKit

class CityInfoViewController: UIViewController {
    let cityInfo = CityInfo().city

    @IBOutlet var cityInfoTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabelView()
        registerXIB()
    }

    private func setupTabelView() {
        cityInfoTableView.delegate = self
        cityInfoTableView.dataSource = self
        cityInfoTableView.rowHeight = 120
        cityInfoTableView.separatorStyle = .none
    }

    private func registerXIB() {
        let xib = UINib(nibName: CityInfoTableViewCell.identifier, bundle: nil)
        cityInfoTableView.register(xib, forCellReuseIdentifier: CityInfoTableViewCell.identifier)
    }
}

extension CityInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoTableViewCell.identifier, for: indexPath) as? CityInfoTableViewCell else {
            return UITableViewCell()
        }
        let data = cityInfo[indexPath.row]
        cell.setupData(data)

        return cell
    }
}
