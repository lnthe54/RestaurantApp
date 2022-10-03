//
//  PopularView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct PopularFoodView: View {
    // MARK: - PROPERTY
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    @State private var selectedFood: FoodOject!
    
    private var gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Phổ biến")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                LazyVGrid(columns: gridItems, spacing: 10) {
                    ForEach(homeViewModel.popularFoods) { food in
                        Button {
                            self.selectedFood = food
                        } label: {
                            FoodVerticalView(food: food)
                                .background(Color.white.clipShape(CornerRadiusShape()))
                                .shadow(radius: 4)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .fullScreenCover(item: $selectedFood) { selected in
                            FoodDetailView(food: selected)
                        }
                    }
                }
            }
        }
    }
}

struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularFoodView()
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(HomeViewModel())
    }
}
