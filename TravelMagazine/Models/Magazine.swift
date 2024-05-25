//
//  Magazine.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/25/24.
//

import Foundation

struct Magazine {
    var title: String
    var subtitle: String
    var photo_image: String
    var date: String
    var link: String

    var url: URL {
        return URL(string: photo_image)!
    }

    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"

        let convertDate = dateFormatter.date(from: date)!

        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yy년 MM월 dd일"

       return myDateFormatter.string(from: convertDate)
    }
}
