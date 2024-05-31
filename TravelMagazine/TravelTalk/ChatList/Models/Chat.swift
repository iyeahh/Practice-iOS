//
//  Chat.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import Foundation

//채팅 화면에서 사용할 데이터 구조체
struct Chat {
    let user: User
    let date: String
    let message: String

    var formattedDate: String {
        let dateStr = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let convertDate = dateFormatter.date(from: dateStr)
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yy.MM.dd"
        return myDateFormatter.string(from: convertDate!)
    }

    var formattedTime: String {
        let dateStr = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let convertDate = dateFormatter.date(from: dateStr)
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "hh:mm a"
        myDateFormatter.locale = Locale(identifier:"ko_KR")
        return myDateFormatter.string(from: convertDate!)
    }
}
