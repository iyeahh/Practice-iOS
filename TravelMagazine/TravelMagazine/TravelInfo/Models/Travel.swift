//
//  Travel.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/27/24.
//

import Foundation

struct Travel {
    var title: String
    var description: String?
    var travel_image: String?
    var grade: Double?
    var save: Int?
    var like: Bool?
    var ad: Bool

    var likeBool: Bool {
        get {
            like ?? false
        }
        set {
            like = newValue
        }
    }

    var url: URL? {
        if let image = travel_image {
            return URL(string: image)
        } else {
            return nil
        }
    }
}
