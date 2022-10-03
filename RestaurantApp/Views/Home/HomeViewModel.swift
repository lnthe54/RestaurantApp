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
    
    private var foodService: FoodService
    
    init(_ foodsBanner: [FoodOject] = [], foodService: FoodService = FoodService()) {
        self.foodsBanner = foodsBanner
        self.foodService = foodService
    }

    func onAppear() {
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
        case 6..<13 :
            timeText = "Chào buổi sáng"
        case 13..<17:
            timeText = "Chào buổi chiều"
        case 17..<22:
            timeText = "Chào buổi tối"
        default:
            timeText = ""
        }
    }
}
