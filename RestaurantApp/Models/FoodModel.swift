//
//  FoodTypeModel.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import Foundation

struct FoodOject: Codable, Identifiable {
    let id: Int
    var name: String
    let image: String
    let headline: String
    let stars: Int
    let price: String
    let description: String
}
