//
//  TamagochiList.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import UIKit

class TamagochiList {
    var list: [Tamagochi] = []

    init() {
        setReadyCell()
    }

    func setReadyCell() {
        list.append(
            Tamagochi(
                character: .tingling,
                exp: Exp(
                    riceCount: UserDefaultManager.riceCount,
                    waterCount: UserDefaultManager.waterCount)
            )
        )
        list.append(
            Tamagochi(
                character: .smile,
                exp: Exp(
                    riceCount: UserDefaultManager.riceCount,
                    waterCount: UserDefaultManager.waterCount)
            )
        )
        list.append(
            Tamagochi(
                character: .twinkle,
                exp: Exp(
                    riceCount: UserDefaultManager.riceCount,
                    waterCount: UserDefaultManager.waterCount)
            )
        )
        for _ in 1...18 {
            list.append(Tamagochi(character: .none, exp: Exp()))
        }
    }
}


