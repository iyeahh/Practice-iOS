//
//  UserDefault.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import Foundation

@propertyWrapper
struct UserDefault {
    let key: String
    let reset: Bool
    let storage: UserDefaults = UserDefaults.standard

    var wrappedValue: Int {
        get {
            if reset {
                self.storage.removeObject(forKey: key)
                return self.storage.integer(forKey: key)
            } else {
                return self.storage.integer(forKey: key)
            }
        }
        set {
            self.storage.set(newValue, forKey: self.key)
        }
    }
}
