//
//  FoodVerticalView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct FoodVerticalView: View {
    
    // MARK: - PROPERTY
    @EnvironmentObject var shop: Shop
    
    let food: PopularFoodObject
    
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
                
                HStack {
                    Image(systemName: "dot.square")
                        .foregroundColor(Color.green)
                    
                    Spacer()
                }
                
                HStack(spacing: 0) {
                    Text("$")
                        .foregroundColor(Constant.colorPimary)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(food.price)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        // Action
                        withAnimation(.easeOut) {
                            UserDefaults.standard.set(food.name, forKey: "name")
                            UserDefaults.standard.set(food.image, forKey: "image")
                            UserDefaults.standard.set(food.price, forKey: "price")
                            UserDefaults.standard.set(food.description, forKey: "description")
                            shop.selectedFood = food
                            shop.showingFood = true
                        }
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

struct FoodVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        FoodVerticalView(food: Constant.AllFoods[0])
            .previewLayout(.sizeThatFits)
            .frame(width: 180)
            .padding()
            .environmentObject(Shop())
    }
}
