//
//  API.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/10/12.
//

import Foundation

class API {
    
    static let shared = API()
    
    func getFoodBanners(completion: @escaping ([FoodOject]) -> Void) {
        NetworkHelper.get(URLPath.GET_FOOD_BANNER,
                          responseType: [FoodOject].self,
                          completionHandler: { response in
            completion(response)
        }, errorHandler: { error in
            print(error.localizedDescription)
        })
    }
    
    func getFoodPopulars(completion: @escaping ([FoodOject]) -> Void) {
        NetworkHelper.get(URLPath.GET_FOOD_POPULAR,
                          responseType: [FoodOject].self,
                          completionHandler: { response in
            completion(response)
        }, errorHandler: { error in
            print(error.localizedDescription)
        })
    }
}
