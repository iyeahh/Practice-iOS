//
//  Lotto.swift
//  MediaProject
//
//  Created by Bora Yang on 6/5/24.
//

import Foundation

struct Lotto: Decodable {
    let drwNo: Int?
    let drwNoDate: String?
    let drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, bnusNo: Int?

    var date: String {
        guard let date = drwNoDate else { return "" }
        return "\(date) 추첨"
    }

    var numberDescription: String {
        guard let number = drwNo else { return "" }
        return "\(number)회 당첨결과"
    }

    var sortedNumber: [Int] {
        guard let num1 = drwtNo1,
              let num2 = drwtNo2,
              let num3 = drwtNo3,
              let num4 = drwtNo4,
              let num5 = drwtNo5,
              let num6 = drwtNo6 else { return [0]}

        var array = [num1, num2, num3, num4, num5, num6]
        return array.sorted()
    }
}
