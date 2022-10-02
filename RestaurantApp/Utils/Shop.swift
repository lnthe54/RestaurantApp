//
//  Shop.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import Foundation

class Shop: ObservableObject {
    
    @Published var showingFood: Bool = false
    @Published var selectedFood: PopularFoodObject? = nil
    @Published var selectedSubFood: PopularFoodOtherObject? = nil
}
