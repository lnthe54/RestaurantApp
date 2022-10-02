//
//  FoodTypeModel.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import Foundation

struct Foods {
    let foods: [FoodOject]
}

struct FoodOject: Codable, Identifiable {
    let id: Int
    let image: String
    let headline: String
}

struct PopularFoodObject: Codable, Identifiable {
    
    let id: Int
    var name: String
    let image: String
    let headline: String
    let price: String
    let description: String
    let OtherFoods: [PopularFoodOtherObject]
    
}

struct PopularFoodOtherObject: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let headline: String
    let price: String
    let description: String
}
