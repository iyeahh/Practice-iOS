//
//  MapViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/30/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    static let identifier = "MapViewController"
    var viewModel: RestaurantViewModel?

    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupAllAnnotation()
        setupCenterLocation()
    }

    private func setupNavigationItem() {
        let filterButton = UIBarButtonItem(
            title: "Filter",
            style: .plain,
            target: self,
            action: #selector(filterButtonTapped)
        )

        navigationItem.rightBarButtonItem = filterButton
    }

    private func setupAllAnnotation() {
        guard let restaurantList = viewModel?.restaurantListData else {
            return
        }

        addAnnotation(retaurants: restaurantList)
    }

    private func setupCenterLocation() {
        guard let restaurant = viewModel?.restaurantListData.randomElement() else {
            return
        }

        setCenterLocation(restaurant: restaurant)
    }

    private func setCenterLocation(restaurant: RestaurantInfo) {
        let center = CLLocationCoordinate2D(
            latitude: restaurant.latitude,
            longitude: restaurant.longitude
        )

        mapView.region = MKCoordinateRegion(
            center: center,
            latitudinalMeters: 500,
            longitudinalMeters: 500
        )
    }

    private func filterRestaurant(category: Category) {
        if category == .all {
            setupAllAnnotation()
        } else {
            if let filteredList = viewModel?.restaurantListData.filter({ restaurant in restaurant.category == category
            }) {
                addAnnotation(retaurants: filteredList)
            }
        }
    }

    @objc private func filterButtonTapped() {
        let actionSheet = UIAlertController(
            title: "필터 설정",
            message: nil,
            preferredStyle: .actionSheet)

        let all = UIAlertAction(
            title: "전체보기",
            style: .default,
            handler: { _ in
                self.filterRestaurant(category: .all)
            }
        )

        let koreanFood = UIAlertAction(
            title: "한식",
            style: .default,
            handler: { _ in self.filterRestaurant(category: .korean)
            }
        )

        let chineseFood = UIAlertAction(
            title: "중식",
            style: .default,
            handler: { _ in self.filterRestaurant(category: .chinese)
            }
        )

        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel
        )

        actionSheet.addAction(all)
        actionSheet.addAction(koreanFood)
        actionSheet.addAction(chineseFood)
        actionSheet.addAction(cancel)

        present(actionSheet, animated: true)
    }

    private func makeAnnotations(restaurant: RestaurantInfo) -> MKAnnotation{
        let location = CLLocationCoordinate2D(
            latitude: restaurant.latitude,
            longitude: restaurant.longitude
        )

        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = restaurant.name

        return annotation
    }

    private func addAnnotation(retaurants: [RestaurantInfo]) {
        mapView.removeAnnotations(mapView.annotations)

        let annotations = retaurants.map({ retaurant in
            makeAnnotations(restaurant: retaurant)
        })

        mapView.addAnnotations(annotations)
    }
}
