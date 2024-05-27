//
//  RestaurantViewModel.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import Foundation

class RestaurantViewModel {
    var restaurantListData: [RestaurantInfo]
    var filteredList: [RestaurantInfo] = []
    var isLikeButton = false

    var restaurantCount: Int {
        filteredList.count
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

        filteredList = restaurantListData
    }

    func changeLikeStatus(index: Int) {
        let firstIndex = restaurantListData.firstIndex { restaurnatInfo in
            restaurnatInfo.name == filteredList[index].name
        }
        guard let number = firstIndex else {
            return
        }
        restaurantListData[number].like.toggle()
    }

    func getLikeRestaurantList() {
        isLikeButton.toggle()

        if isLikeButton {
            let likeRestaurant = self.restaurantListData.filter { restaurantInfo in
                restaurantInfo.like == true
            }
            filteredList = likeRestaurant
        } else {
            filteredList = restaurantListData
        }
    }

    func getCategoryRestaurantList(category: String) {
        if category == "All" {
            filteredList = restaurantListData
        } else {
            let categoryRestaurant = self.restaurantListData.filter { restaurantInfo in
                restaurantInfo.category == Category(rawValue: category)
            }
            filteredList = categoryRestaurant
        }
    }

    func getPriceRetaurantList(price: Int) {
        if price == 0 {
            filteredList = restaurantListData
        } else {
            let priceRestaurant = self.restaurantListData.filter { restaurantInfo in
                restaurantInfo.price < price
            }
            filteredList = priceRestaurant
        }
    }
}
