//
//  Weather.swift
//  MediaProject
//
//  Created by Bora Yang on 6/8/24.
//

import Foundation

// MARK: - FiveDayWeather
struct Weather: Codable {
    let coord: Coord?
    let main: Main?
    let wind: Wind?
    let dt: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double?
}

// MARK: - Main
struct Main: Codable {
    let temp: Double?
    let humidity: Int?
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
}
