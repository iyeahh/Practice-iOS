//
//  CityInfoViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/29/24.
//

import UIKit

class CityInfoViewController: UIViewController {
    let cityInfo = CityInfo()
    var filteredCityList: [City] = []
    var currentCityList: [City] = []
    var searchWord: String = ""

    @IBOutlet var cityInfoTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabelView()
        registerXIB()
        navigationItem.title = "인기 도시"
        searchBar.delegate = self
        filteredCityList = cityInfo.city
    }

    private func setupTabelView() {
        cityInfoTableView.delegate = self
        cityInfoTableView.dataSource = self
        cityInfoTableView.rowHeight = 130
        cityInfoTableView.separatorStyle = .none
    }

    private func registerXIB() {
        let xib = UINib(nibName: CityInfoTableViewCell.identifier, bundle: nil)
        cityInfoTableView.register(xib, forCellReuseIdentifier: CityInfoTableViewCell.identifier)
    }

    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            filteredCityList = cityInfo.city
        } else if sender.selectedSegmentIndex == 1 {
            filteredCityList = cityInfo.domesticCityList
        } else {
            filteredCityList = cityInfo.overseasCityList
        }
        currentCityList = filteredCityList
        cityInfoTableView.reloadData()
    }

    // 스크롤 내렸을 때 키보드 내려가기
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
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
        cell.setupData(data, text: searchWord)
        return cell
    }
}

extension CityInfoViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        searchWord(text: searchText)
        // 검색 눌렀을 때 키보드 내려가기
        view.endEditing(true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchWord(text: searchText)
    }

    private func searchWord(text: String) {
        let searchText = text.removeWhitespaces()
        let lowercasedText = searchText.lowercased()

        let list = currentCityList.filter { city in
            city.city_name.contains(searchText) || (city.city_english_name).lowercased().contains(lowercasedText) || city.city_explain.contains(searchText)
        }

        filteredCityList = list
        searchWord = searchText
        cityInfoTableView.reloadData()
    }
}
