//
//  Travel.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/27/24.
//

import Foundation

struct Travel {
    var title: String?
    var description: String?
    var travel_image: String?
    var grade: Double?
    var save: Int?
    var like: Bool?
    var ad: Bool

    var titleString: String {
        return title ?? "제목 없음"
    }

    var descriptionString: String {
        return description ?? "설명 없음"
    }

    var gradeDouble: Double {
        return grade ?? 0.0
    }

    var saveInt: Int {
        return save ?? 0
    }

    var likeBool: Bool {
        get {
            like ?? false
        }
        set {
            like = newValue
        }
    }

    var url: URL? {
        if let image = travel_image {
            return URL(string: image)
        } else {
            return nil
        }
    }

    var saveText: String {
        "(\(gradeDouble)) · 저장 " +  saveInt.formatted()
    }
}
