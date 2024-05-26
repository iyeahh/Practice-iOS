//
//  RestaurantViewModel.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import Foundation

class RestaurantViewModel {
    var restaurantListData: [RestaurantInfo]

    var restaurantCount: Int {
        restaurantListData.count
    }

    init() {
        restaurantListData = RestaurantList().restaurantArray.map({ restaurant in
            RestaurantInfo(
                image: restaurant.image,
                name: restaurant.name,
                address: restaurant.address,
                phoneNumber: restaurant.phoneNumber,
                category: Category(rawValue: restaurant.category)!,
                price: restaurant.price)
        })
    }

    func getLikeRestaurantList() {
        let likeRestaurant = self.restaurantListData.filter { restaurantInfo in
            restaurantInfo.like == true
        }
        restaurantListData = likeRestaurant
    }

    func getCategoryRestaurantList(category: String) {
        let categoryRestaurant = self.restaurantListData.filter { restaurantInfo in
            restaurantInfo.category == Category(rawValue: category)
        }
        restaurantListData = categoryRestaurant
    }
}
