//
//  RestaurantViewModel.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import Foundation

class RestaurantViewModel {
    var restaurantListData: [RestaurantInfo] = RestaurantList().restaurantArray.map({ restaurant in
        RestaurantInfo(
            image: restaurant.image,
            name: restaurant.name,
            address: restaurant.address,
            phoneNumber: restaurant.phoneNumber,
            category: restaurant.category,
            price: restaurant.price)
    })

    var restaurantCount: Int {
        restaurantListData.count
    }
}
