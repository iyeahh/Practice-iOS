//
//  City.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/29/24.
//

import Foundation

struct City {
    let city_name: String
    let city_english_name: String
    let city_explain: String
    let city_image: String
    let domestic_travel: Bool

    var cityName: String {
        return city_name + "|" + city_english_name
    }

    var url: URL? {
        return URL(string: city_image)
    }
}
