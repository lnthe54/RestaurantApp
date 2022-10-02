//
//  FoodHorizontalView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct FoodHorizontalView: View {
    
    // MARK: - PROPERTY
    let otherFoods: [PopularFoodOtherObject]
    @EnvironmentObject var shop : Shop
    
    var body: some View {
        // MARK: - VSTACK
        VStack(alignment: .center) {
            ForEach(otherFoods) { food in
                // MARK: - CONTENT VIEW
                VStack(alignment: .center) {
                    Text(food.name)
                        .font(.footnote)
                        .fontWeight(.bold)
                    
                    Text(food.headline)
                        .font(.caption)
                        .fontWeight(.light)
                    
                    HStack  {
                        Image(food.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        
                        VStack {
                            HStack(spacing: 0) {
                                Text("$")
                                    .foregroundColor(Constant.colorPimary)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                
                                Text(food.price)
                                    .font(.caption)
                                    .fontWeight(.bold)
                            }
                            
                            Button {
                                // Action
                                withAnimation(.easeOut) {
                                    UserDefaults.standard.set(food.name, forKey: "name")
                                    UserDefaults.standard.set(food.image, forKey: "image")
                                    UserDefaults.standard.set(food.price, forKey: "price")
                                    UserDefaults.standard.set(food.description, forKey: "description")

                                    shop.showingFood = true
                                }
                            } label: {
                                Spacer()
                                Image(systemName: "plus")
                                    .foregroundColor(Color.white)
                                    
                                Spacer()
                            }
                            .padding(4)
                            .background(Constant.colorPimary)
                            .cornerRadius(50)
                            .frame(width: 30)
                        }
                    }
                    
                    HStack{
                        Image(systemName: "dot.square")
                            .foregroundColor(Color.green)
                        Spacer()
                    }
                    
                } // MARK: - END CONTENT VIEW
                .padding(12)
                .background(Color.white.clipShape(CornerRadiusShape()))
                .shadow(radius: 4)
            }
        }
    }
}

