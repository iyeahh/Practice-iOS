//
//  MovieCredits.swift
//  MediaProject
//
//  Created by Bora Yang on 6/10/24.
//

import Foundation

struct MovieCredits: Decodable {
    let id: Int
    let cast: [PlayActor]?
}

struct PlayActor: Decodable {
    let name: String?
    let profile_path: String?
    let character: String?
}
