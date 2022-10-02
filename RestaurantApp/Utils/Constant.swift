//
//  Constant.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct Constant {
    
    static let colorPimary: Color = Color(hex: "#FF6600")
    static let colorSubPimary: Color = Color(hex: "#FF751A")
    static let colorEFEFEF: Color = Color(hex: "#EFEFEF")
    static let colorFFBC0B: Color = Color(hex: "#FFBC0B") // Yellow
    
    // MARK: - DATA TEST
    static let FeaturedFoods: [FoodOject] = Bundle.main.decode("food.json")
    static let AllFoods: [PopularFoodObject] = Bundle.main.decode("AllFoods.json")
    static let AllOtherTypes = [PopularFoodOtherObject].self
}
