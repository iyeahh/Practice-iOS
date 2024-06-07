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
        list.append(Tamagochi(name: "따끔따끔", imageString: "1-6"))
        list.append(Tamagochi(name: "방실방실", imageString: "2-6"))
        list.append(Tamagochi(name: "반짝반짝", imageString: "3-6"))
        for _ in 1...18 {
            list.append(Tamagochi(name: "준비중에요", imageString: "noImage"))
        }
    }
}


