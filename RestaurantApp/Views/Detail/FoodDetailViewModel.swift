//
//  FoodDetailViewModel.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/10/04.
//

import Foundation

class FoodDetailViewModel: ObservableObject {
    
    init() {
        
    }
    
    func addFoodToCart(_ food: FoodOject, quantity: Int) {
        var cartFoods: [CartObject] = UserDataDefaults.shared.getCartFoods()
        
        var isExist: Bool = false
        
        let cardObject = CartObject(id: food.id, name: food.name, image: food.image, price: food.price, quantity: quantity)
        
        if cartFoods.isEmpty {
            cartFoods.append(cardObject)
        } else {
            for cart in cartFoods {
                if food.id == cart.id {
                    isExist = true
                    cart.quantity += quantity
                    break
                }
            }
            
            if !isExist {
                cartFoods.append(cardObject)
            }
        }
        
        // Save to local
        UserDataDefaults.shared.setCartFoods(cartFoods)
    }
}
