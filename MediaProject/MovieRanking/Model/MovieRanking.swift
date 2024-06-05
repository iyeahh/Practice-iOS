//
//  MovieRanking.swift
//  MediaProject
//
//  Created by Bora Yang on 6/5/24.
//

import Foundation

struct BoxOfficeData: Codable {
    let boxOfficeResult: BoxOfficeResult?
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOfficeList]?
}

struct DailyBoxOfficeList: Codable {
    let rank, movieNm, openDt: String?
}
