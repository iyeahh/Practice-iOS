//
//  Character.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import Foundation

enum Character: String {
    case tingling = "따끔따끔"
    case smile = "방실방실"
    case twinkle = "반짝반짝"
    case none = "준비중이에요"

    var description: String {
        switch self {
        case .tingling:
            return "저는 선인장 다마고치 입니다. 키는 2cm\n몸무게는 150g이에요.\n성격은 소심하지만 마음은 따뜻해요.\n열심히 잘 먹고 잘 클 자신은 있답니다.\n반가워요 주인님!!!"
        case .smile:
            return "저는 방실방실 다마고치 입니당 키는 100cm\n몸무게는 15kg이에용\n성격은 화끈하고 날라다닙니당~!\n열심히 잘 먹고 잘 클 자신은\n있답니당 방실방실!"
        case .twinkle:
            return "저는 반짝반짝 다마고치 에유. 키는 50cm\n몸무게는 3kg이에유\n성격은 느긋하고 빛나유✨\n열심히 잘 먹고 잘 클 자신은 있어유~\n예쁘게 키워주세요ㅎㅎ"
        case .none:
            return ""
        }
    }

    var fullName: String {
        if self.rawValue == "준비중이에요" {
            return "준비중이에요"
        } else {
            return self.rawValue + " 다마고치"
        }
    }

    var imageString: String {
        switch self {
        case .tingling:
            return "1-"
        case .smile:
            return "2-"
        case .twinkle:
            return "3-"
        case .none:
            return ""
        }
    }
}
