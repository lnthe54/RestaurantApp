//
//  FoodVerticalView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct FoodVerticalView: View {
    
    // MARK: - PROPERTY
    @ObservedObject var homeViewModel: HomeViewModel

    let food: FoodOject

    var body: some View {
        // MARK: - ZSTACK
        ZStack {
            VStack {
                Text(food.name)
                    .fontWeight(.bold)
                    .font(.headline)
                
                Text(food.headline)
                    .font(.footnote)
                    .fontWeight(.light)
                
                Image(food.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 140)
                
                // MARK: - RATING VIEW
                HStack(spacing: 5) {
                    ForEach(0..<food.stars) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    .padding(.bottom)
                } // MARK: - END RATING VIEW
                
                HStack(spacing: 5) {
                    Text("vnđ")
                        .foregroundColor(Constant.colorPimary)
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                    
                    Text(food.price.convertToString())
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        // Action
                        self.homeViewModel.isAddItem = true
                        self.homeViewModel.addFoodToCart(food, quantity: 1)
                        self.homeViewModel.itemOfCart = UserDataDefaults.shared.getCartFoods().count
                    } label: {
                        Spacer()
                        Image(systemName: "plus")
                            .foregroundColor(Color.white)
                            
                        Spacer()
                    }
                    .padding(8)
                    .background(Constant.colorPimary)
                    .cornerRadius(50)
                    .frame(width: 50)
                }
            }
        } // MARK: - END ZSTACK
        .padding(12)
    }
}
