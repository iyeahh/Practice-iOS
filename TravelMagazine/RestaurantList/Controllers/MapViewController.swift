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
        viewModel?.restaurantListData.forEach({ retaurantInfo in
            addAnnotations(restaurant: retaurantInfo)
        })
        guard let restaurant = viewModel?.restaurantListData[3] else { return }
        setCenterLocation(restaurant: restaurant)
    }

    private func addAnnotations(restaurant: RestaurantInfo) {
        let location = CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = restaurant.name
        mapView.addAnnotation(annotation)
    }

    // TODO: 뷰컨트롤러 진입 시 전체 어노테이션 보여주기
    private func setCenterLocation(restaurant: RestaurantInfo) {
        let center = CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
    }
}
