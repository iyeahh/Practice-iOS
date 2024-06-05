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
            return #colorLiteral(red: 0.9962949157, green: 0.7961898446, blue: 0, alpha: 1)
        case 11...20:
            return #colorLiteral(red: 0.4103222191, green: 0.7773628235, blue: 0.9422243237, alpha: 1)
        case 21...30:
            return #colorLiteral(red: 0.9975349307, green: 0.4412096143, blue: 0.4458649755, alpha: 1)
        case 31...40:
            return .gray
        default:
            return #colorLiteral(red: 0.6941176471, green: 0.8196078431, blue: 0.5098039216, alpha: 1)
        }
    }
}
