//
//  User.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import Foundation

enum User: String {
    case hue = "Hue"
    case jack = "Jack"
    case bran = "Bran"
    case den = "Den"
    case user = "iyeah"
    case other_friend = "내옆자리의앞자리에개발잘하는친구"
    case simsim = "심심이"

    var profileImage: String {
        switch self {
        default: return rawValue
        }
    }
}
