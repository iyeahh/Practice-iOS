//
//  Tamagochi.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import UIKit

struct Tamagochi {
    var character: Character
    var exp: Exp

    var image: UIImage? {
        if character == .none {
            return UIImage(named: "noImage")
        } else if exp.levelImage == "10" {
            return UIImage(named: character.imageString + "9")
        } else {
            return UIImage(named: character.imageString + exp.levelImage)
        }
    }
}
