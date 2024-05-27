//
//  TravelInfoViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/27/24.
//

import UIKit
import Kingfisher

class TravelInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let travel: [Travel] = [
        Travel(title: "하나우마 베이",
               description: "아름다운 자연을 감상할 수 있는 스노쿨링 명소",
               travel_image: "https://images.unsplash.com/photo-1539498508910-091b5e859b1d?q=80&w=3250&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
               grade: 4.8,
               save: 6932,
               like: false,
               ad: false),
        Travel(title: "쿠알로아 랜치",
               description: "광활한 대자연에서 즐기는 다양하고 재미있는 액티비티",
               travel_image: "https://images.unsplash.com/photo-1709380733305-e65f500ab1ac?q=80&w=3264&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
               grade: 4.9,
               save: 5167,
               like: true,
               ad: false),
        Travel(title: "알라 모아나 센터",
               description: "하와이 최고의 쇼핑 명소",
               travel_image: "https://images.unsplash.com/photo-1600215754990-6e7946d1e37a?q=80&w=2592&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
               grade: 3.8,
               save: 8262,
               like: true,
               ad: false),
        Travel(title: "와이키키 비치",
               description: "세계적으로 유명한 하와이 최고의 해변",
               travel_image: "https://images.unsplash.com/photo-1507876466758-bc54f384809c?q=80&w=3309&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
               grade: 4.2,
               save: 7892,
               like: true,
               ad: false),
        Travel(title: "하와이 여행을 가고싶다면?\n수업이 있는데 가실 생각은 아니시죠?",
               description: nil,
               travel_image: nil,
               grade: nil,
               save: nil,
               like: nil,
               ad: true)
    ]

    @IBOutlet var travelTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        registerXIB()
    }

    private func setupTableView() {
        travelTableView.delegate = self
        travelTableView.dataSource = self
    }

    func registerXIB() {
        let xib = UINib(nibName: "TravelInfoTableViewCell", bundle: nil)
        travelTableView.register(xib, forCellReuseIdentifier: "TravelInfoTableViewCell")

        let xib2 = UINib(nibName: "BannerTableViewCell", bundle: nil)
        travelTableView.register(xib2, forCellReuseIdentifier: "BannerTableViewCell")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if travel[indexPath.row].ad {
            return 100
        } else {
            return 150
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = travel[indexPath.row]

        if data.ad {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as? BannerTableViewCell else {
                return UITableViewCell()
            }
            cell.setupData(data)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TravelInfoTableViewCell", for: indexPath) as? TravelInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.setupData(data)
            return cell
        }
    }
}
