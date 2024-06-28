//
//  NetworkError.swift
//  Movie
//
//  Created by Bora Yang on 6/28/24.
//

import Foundation

enum NetworkError: Error {
    case failedRequest
    case noData
    case invalidResponse
    case invalidData
}
