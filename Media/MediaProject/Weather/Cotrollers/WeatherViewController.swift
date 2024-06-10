//
//  WeatherViewController.swift
//  MediaProject
//
//  Created by Bora Yang on 6/8/24.
//

import UIKit
import Alamofire
import SnapKit
import CoreLocation

class WeatherViewController: UIViewController {

    var temp: Double? {
        didSet {
            tableView.reloadData()
        }
    }
    var humidity: Int?
    var wind: Double?

    let dateLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        return label
    }()

    let locationLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    let tableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureHierarchy()
        configureLayout()
        configureTableView()
        callRequest()
    }

    private func configureUI() {
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    }

    private func configureHierarchy() {
        view.addSubview(dateLabel)
        view.addSubview(locationLabel)
        view.addSubview(tableView)
    }

    private func configureLayout() {
        dateLabel.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(40)
            make.height.equalTo(30)
        }

        locationLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }

        tableView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view).inset(40)
            make.top.equalTo(locationLabel.snp.bottom).offset(20)
        }
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        tableView.register(WeatherImageTableViewCell.self, forCellReuseIdentifier: WeatherImageTableViewCell.identifier)
    }

    private func callRequest() {
        AF.request(URLString.weather).responseDecodable(of: Weather.self) { response in
            switch response.result {
            case .success(let value):
                self.temp = value.main?.temp
                self.humidity = value.main?.humidity
                self.wind = value.wind?.speed
                self.dateLabel.text = self.dateFormatter(data: value.dt)
                self.getAddress(lat: value.coord?.lat, lon: value.coord?.lon)
                print(Date(timeIntervalSince1970: Double(value.dt ?? 0)))
            case .failure(let error):
                print(error)
            }
        }
    }

    private func dateFormatter(data: Int?) -> String {
        if let timeResult = data {
            let date = Date(timeIntervalSince1970: Double(timeResult))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM월 dd일 HH시 mm분"
            return dateFormatter.string(from: date)
        }
        return ""
    }

    func getAddress(lat: Double?, lon: Double?) {
        guard let lat = lat,
              let lon = lon else { return }
        let location = CLLocation(latitude: lat, longitude: lon)
        let geocoder = CLGeocoder()
        let locale = Locale(identifier: "Ko-kr")
        geocoder.reverseGeocodeLocation(location, preferredLocale: locale) { [weak self] placemarks, _ in
            guard let placemarks = placemarks?.first,
                  let address = placemarks.subLocality
            else { return }
            DispatchQueue.main.async {
                self?.locationLabel.text = address.description
            }
        }
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherImageTableViewCell.identifier, for: indexPath) as? WeatherImageTableViewCell else {
                return UITableViewCell()
            }

            cell.weatherImageView.image = UIImage(systemName: "star")
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else {
                return UITableViewCell()
            }

            switch indexPath.row {
            case 0:
                cell.descriptionLabel.text = "지금은 \(temp ?? 0)도에요"
            case 1:
                cell.descriptionLabel.text = "\(humidity ?? 0)% 만큼 습해요"
            case 2:
                cell.descriptionLabel.text = "\(wind ?? 0)m/s 의 바람이 불어요"
            default:
                cell.descriptionLabel.text = "오늘도 행복한 하루 보내세요"
            }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 200
        } else {
            return 50
        }
    }
}
