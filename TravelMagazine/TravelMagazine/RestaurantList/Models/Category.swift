//
//  Category.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import Foundation

enum Category: String {
    case all = "All"
    case korean = "한식"
    case chinese = "중식"
    case cafe = "카페"
    case snack = "분식"
    case japanese = "일식"
    case lightWestern = "경양식"
    case western = "양식"

    static let categorys = [all.rawValue, korean.rawValue, chinese.rawValue, cafe.rawValue, snack.rawValue, japanese.rawValue, lightWestern.rawValue, western.rawValue]
}
