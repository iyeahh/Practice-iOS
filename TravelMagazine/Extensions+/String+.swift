//
//  String+.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/29/24.
//

import Foundation

extension String {
    func removeWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
