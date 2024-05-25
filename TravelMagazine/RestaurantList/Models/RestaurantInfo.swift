//
//  RestaurantInfo.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import UIKit

struct RestaurantInfo {
    let image: String
    let name: String
    let address: String
    let phoneNumber: String
    let category: Category
    let price: Int
    var like: Bool = false

    var url: URL {
        return URL(string: image)!
    }

    var labelColor: UIColor {
        switch category {
        case .korean:
                .blue
        case .chinese:
                .red
        case .cafe:
                .brown
        case .snack:
                .orange
        case .japanese:
                .green
        case .lightWestern:
                .yellow
        case .western:
                .purple
        }
    }
}
