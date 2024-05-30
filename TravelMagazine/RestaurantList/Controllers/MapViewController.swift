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

    @IBOutlet var mapkit: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
