//
//  Exp.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import Foundation

struct Exp {
    var riceCount = 0
    var waterCount = 0

    var exp: Int {
        return (riceCount / 5) + (waterCount / 2)
    }

    var levelImage: String {
        switch exp {
        case 0...19:
            return "1"
        case 20...29:
            return "2"
        case 30...39:
            return "3"
        case 40...49:
            return "4"
        case 50...59:
            return "5"
        case 60...69:
            return "6"
        case 70...79:
            return "7"
        case 80...89:
            return "8"
        case 90...99:
            return "9"
        default:
            return "10"
        }
    }

    var description: String {
        return "LV\(levelImage) · 밥알 \(riceCount) · 물방울 \(waterCount)"
    }
}
