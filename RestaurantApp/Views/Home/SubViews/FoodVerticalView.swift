//
//  FoodVerticalView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct FoodVerticalView: View {
    
    // MARK: - PROPERTY
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
                    Text("vnd")
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
                            // Add to cart
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
    }
}
