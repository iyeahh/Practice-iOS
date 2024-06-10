//
//  ReuseIdentifierProtocol.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import UIKit

protocol ReuseIdentifierProtocol {
    static var identifier: String { get }
}

extension UIViewController: ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
