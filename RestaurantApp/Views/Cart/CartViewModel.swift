//
//  CartViewModel.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/10/05.
//

import Foundation

class CartViewModel: ObservableObject {
    // MARK: Property
    @Published var cartFoods: [CartObject] = []
    @Published var totalMoney: Double = 0
    @Published var isBuying: Bool = false
    @Published var isBought: Bool = false
    
    init() {
        self.cartFoods = UserDataDefaults.shared.getCartFoods()
        self.totalMoney = getTotalMoney()
    }
    
    func onAppear() {
        self.cartFoods = UserDataDefaults.shared.getCartFoods()
        self.totalMoney = getTotalMoney()
    }
    
    func deleteFood(at offsets: IndexSet) {
        cartFoods.remove(atOffsets: offsets)
        
        UserDataDefaults.shared.setCartFoods(cartFoods)
    }
    
    func updateFood(_ cartObject: CartObject, quantity: Int) {
        var cartFoods: [CartObject] = UserDataDefaults.shared.getCartFoods()
        
        var isExist: Bool = false
        
        for cart in cartFoods {
            if cart.id == cartObject.id {
                isExist = true
                cart.quantity = quantity
                break
            }
        }
        
        if !isExist {
            cartFoods.append(cartObject)
        }
        
        // Save to local
        UserDataDefaults.shared.setCartFoods(cartFoods)
    }
    
    func getTotalMoney() -> Double {
        totalMoney = 0
        let cartFoods: [CartObject] = UserDataDefaults.shared.getCartFoods()
        
        for cartFood in cartFoods {
            self.totalMoney += Double((cartFood.quantity * cartFood.price))
        }
        
        return totalMoney
    }
    
    func buyOrder(completion: @escaping () -> Void) {
        self.isBuying = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.cartFoods.removeAll()
            UserDataDefaults.shared.setCartFoods(self.cartFoods)
            self.isBuying = false
            self.isBought = true
            
            completion()
        }
    }
}
