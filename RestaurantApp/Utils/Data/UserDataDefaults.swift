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
    static private let keyCartFoods: String = "keyCartFoods"
    static var cardFoods: [CartObject] = []
    
    var isFirstInstall: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDataDefaults.keyIsFirstInstall)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: UserDataDefaults.keyIsFirstInstall)
            UserDefaults.standard.synchronize()
        }
    }
    
    func setCartFoods(_ foods: [CartObject]) {
        let encodeData: Data = NSKeyedArchiver.archivedData(withRootObject: foods)
        UserDefaults.standard.set(encodeData, forKey: UserDataDefaults.keyCartFoods)
    }
    
    func getCartFoods() -> [CartObject] {
        if let decoded  = UserDefaults.standard.data(forKey: UserDataDefaults.keyCartFoods) {
            let cartFoods = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [CartObject]
            UserDataDefaults.cardFoods = cartFoods
            return cartFoods
        } else {
            return []
        }
    }
}
