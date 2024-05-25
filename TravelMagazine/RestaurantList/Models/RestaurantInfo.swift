//
//  RestaurantInfo.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import Foundation

struct RestaurantInfo {
    let image: String
    let name: String
    let address: String
    let phoneNumber: String
    let category: String
    let price: Int
    var like: Bool = false

    var url: URL {
        return URL(string: image)!
    }
}
