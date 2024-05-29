//
//  CityInfoViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/29/24.
//

import UIKit

class CityInfoViewController: UIViewController {
    let cityInfo = CityInfo().city
    var filteredCityList: [City] = []

    @IBOutlet var cityInfoTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabelView()
        registerXIB()
        filteredCityList = cityInfo
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

    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            filteredCityList = cityInfo
        } else if sender.selectedSegmentIndex == 0 {
            isDomesticCity(true)
        } else {
            isDomesticCity(false)
        }
        cityInfoTableView.reloadData()
    }

    private func isDomesticCity(_ isDomestic: Bool) {
        if isDomestic {
            let domesticCities = cityInfo.filter { city in
                city.domestic_travel == true
            }
            filteredCityList = domesticCities
        } else {
            let overseasCities = cityInfo.filter { city in
                city.domestic_travel == false
            }
            filteredCityList = overseasCities
        }
    }
}

extension CityInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoTableViewCell.identifier, for: indexPath) as? CityInfoTableViewCell else {
            return UITableViewCell()
        }
        let data = filteredCityList[indexPath.row]
        cell.setupData(data)

        return cell
    }
}
