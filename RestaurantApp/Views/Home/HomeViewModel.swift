//
//  HomeViewModel.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/10/02.
//

import Foundation

class HomeViewModel: ObservableObject {
    // MARK: Property
    @Published var foodsBanner: [FoodOject] = []
    @Published var popularFoods: [FoodOject] = []
    @Published var timeText: String = ""
    @Published var itemOfCart: Int = UserDataDefaults.shared.getCartFoods().count
    @Published var isAddItem: Bool = false
    
    private var foodService: FoodService
    
    init(_ foodsBanner: [FoodOject] = [], foodService: FoodService = FoodService()) {
        self.foodsBanner = foodsBanner
        self.foodService = foodService
    }

    func onAppear() {
        UserDataDefaults.shared.isFirstInstall = true
        getTextFromTime()
        getAllData()
    }
    
    private func getAllData() {
        let group = DispatchGroup()
        
        group.enter()
        self.foodService.getFoodBanner { foods in
            self.foodsBanner = foods
            group.leave()
        }
        
        group.enter()
        self.foodService.getPopularFood { popularFoods in
            self.popularFoods = popularFoods
            group.leave()
        }
        
        group.notify(queue: .main) {
            // Update
        }
    }
    
    private func getTextFromTime() {
        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {
        case 6..<10:
            timeText = "Chào buổi sáng"
        case 10..<13:
            timeText = "Chào buổi trưa"
        case 13..<17:
            timeText = "Chào buổi chiều"
        case 17..<24:
            timeText = "Chào buổi tối"
        default:
            timeText = ""
        }
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
