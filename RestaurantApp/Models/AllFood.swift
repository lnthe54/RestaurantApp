//
//  AllFood.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import Foundation

struct AllFoodObject: Codable, Identifiable {
    
    let id: Int
    var name: String
    let image: String
    let headline: String
    let price: String
    let description: String
    let OtherTypes: [AllOtherTypesObject]
    
}

struct AllOtherTypesObject: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let headline: String
    let price: String
    let description: String
}
