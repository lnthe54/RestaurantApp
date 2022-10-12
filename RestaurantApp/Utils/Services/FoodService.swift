//
//  FoodService.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/10/02.
//

import Combine
import Foundation

protocol FoodServiceProtocol {
    func getFoodBanner(completion: @escaping ([FoodOject]) -> Void)
    func getPopularFood(completion: @escaping ([FoodOject]) -> Void)
}

class FoodService: FoodServiceProtocol {
    
    init() {
    }
    
    func getFoodBanner(completion: @escaping ([FoodOject]) -> Void) {
        API.shared.getFoodBanners { foodBanners in
            completion(foodBanners)
        }
    }
    
    func getPopularFood(completion: @escaping ([FoodOject]) -> Void) {
        API.shared.getFoodPopulars { foodPopulars in
            completion(foodPopulars)
        }
    }
}
