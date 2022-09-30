//
//  UserDataDefaults.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/30.
//

import Foundation

class UserDataDefaults {
    
    static let shared = UserDataDefaults()

    static private let keyIsFirstInstall: String = "keyIsFirstInstall"
    
    var isFirstInstall: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDataDefaults.keyIsFirstInstall)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: UserDataDefaults.keyIsFirstInstall)
            UserDefaults.standard.synchronize()
        }
    }
}
