//
//  UserDefaultManager.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import Foundation

final class UserDefaultManager {
    @UserDefault(key: "rice", reset: false)
    static var riceCount

    @UserDefault(key: "water", reset: false)
    static var waterCount

    @UserDefault(key: "rice", reset: true)
    static var resetRiceCount

    @UserDefault(key: "water", reset: true)
    static var resetWaterCount
}
