//
//  UserDefaultManager.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import Foundation

final class UserDefaultManager {
    @UserDefault(key: "character", defaultValue: "twinkle")
    static var character: String

    @UserDefault(key: "rice", defaultValue: 0)
    static var riceCount: Int

    @UserDefault(key: "water", defaultValue: 0)
    static var waterCount: Int

    @UserDefault(key: "nickname", defaultValue: "대장")
    static var nickname: String

    @UserDefault(key: "isSelected", defaultValue: false)
    static var isSelected: Bool
}
