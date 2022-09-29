//
//  Shop.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import Foundation

class Shop: ObservableObject {
    
    @Published var showingFood: Bool = false
    @Published var selectedFood: AllFoodObject? = nil
    @Published var selectedSubFood: AllOtherTypesObject? = nil
}
