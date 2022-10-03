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
        let dataTest: [FoodOject] = Bundle.main.decode("food.json")
        completion(dataTest)
    }
    
    func getPopularFood(completion: @escaping ([FoodOject]) -> Void) {
        let dataTest: [FoodOject] = Bundle.main.decode("AllFoods.json")
        completion(dataTest)
    }
}
