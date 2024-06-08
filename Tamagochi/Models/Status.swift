//
//  Status.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/8/24.
//

import Foundation

enum Status {
    case choice
    case edit

    var navigationTitle: String {
        switch self {
        case .choice:
            return "다마고치 선택하기"
        case .edit:
            return "다마고치 변경하기"
        }
    }

    var buttonTitle : String {
        switch self {
        case .choice:
            return "시작하기"
        case .edit:
            return "변경하기"
        }
    }
}
