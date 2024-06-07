//
//  Tamagochi.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import UIKit

struct Tamagochi {
    var name: String
    var imageString: String

    var image: UIImage? {
        return UIImage(named: imageString)
    }

    var fullName: String {
        return name == "준비중이에요" ? name : "\(name) 다마고치"
    }

    var description: String {
        return "저는 \(fullName)입니당 키는 100km\n몸무게는 150톤이에용\n성격은 화끈하고 날라다닙니당~!\n열심히 잘 먹고 잘 클 자신은\n있답니당 \(name)!"
    }
}
