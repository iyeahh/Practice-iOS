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
    @IBOutlet var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabelView()
        registerXIB()
        navigationItem.title = "인기 도시"
        searchBar.delegate = self
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
        } else if sender.selectedSegmentIndex == 1 {
            isDomesticCity(true)
        } else {
            isDomesticCity(false)
        }
        cityInfoTableView.reloadData()
    }

    private func isDomesticCity(_ isDomestic: Bool) {
        if isDomestic {
            let domesticCityList = cityInfo.filter { city in
                city.domestic_travel == true
            }
            filteredCityList = domesticCityList
        } else {
            let overseasCityList = cityInfo.filter { city in
                city.domestic_travel == false
            }
            filteredCityList = overseasCityList
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

extension CityInfoViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let inputText = searchBar.text else {
            return
        }
        searchWord(text: inputText)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchWord(text: searchText)
    }

    private func searchWord(text: String) {
        let searchText = text.removeWhitespaces()
        let lowercasedText = searchText.lowercased()

        let list = cityInfo.filter { city in
            city.city_name.contains(searchText) || (city.city_english_name).lowercased().contains(lowercasedText) || city.city_explain.contains(searchText)
        }
        filteredCityList = list
        cityInfoTableView.reloadData()
    }
}
