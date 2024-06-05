//
//  Int+.swift
//  MediaProject
//
//  Created by Bora Yang on 6/5/24.
//

import UIKit

extension Int {
    var backgroundColor: UIColor {
        switch self {
        case 1...10:
            return .yellow
        case 11...20:
            return .blue
        case 21...30:
            return .red
        case 31...40:
            return .gray
        default:
            return .green
        }
    }
}
