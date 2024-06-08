//
//  UserDefault.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    let reset: Bool
    let storage: UserDefaults = UserDefaults.standard

    var wrappedValue: T {
        get {
            if reset {
                self.storage.removeObject(forKey: key)
                return self.storage.object(forKey: key) as? T ?? defaultValue
            } else {
                return self.storage.object(forKey: key) as? T ?? defaultValue
            }
        }
        set {
            self.storage.set(newValue, forKey: self.key)
        }
    }
}
