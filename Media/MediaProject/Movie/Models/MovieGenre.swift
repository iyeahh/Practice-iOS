//
//  MovieGenre.swift
//  MediaProject
//
//  Created by Bora Yang on 6/10/24.
//

import Foundation

enum MovieGenre: Int, CaseIterable {
    case Action = 28
    case Abenteuer = 12
    case Animation = 16
    case Komödie = 35
    case Krimi = 80
    case Dokumentarfilm = 99
    case Drama = 18
    case Familie = 10751
    case Fantasy = 14
    case Historie = 36
    case Horror = 27
    case Musik = 10402
    case Mystery = 9648
    case Liebesfilm = 10749
    case ScienceFiction = 878
    case TVFlim = 10770
    case Thriller = 53
    case Kriegsfilm = 10752
    case Western = 37

    var genre: String {
        String(describing: self)
    }
}
