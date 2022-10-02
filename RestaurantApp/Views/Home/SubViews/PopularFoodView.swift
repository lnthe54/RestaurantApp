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
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Popular")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("See All")
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                }
                
                VStack {
                    ForEach(homeViewModel.popularFoods) { food in
                        HStack(alignment: .center, spacing: 4) {
                            FoodVerticalView(food: food)
                                .background(Color.white.clipShape(CornerRadiusShape()))
                                .shadow(radius: 4)
                            
                            Spacer()
                            
                            FoodHorizontalView(otherFoods: food.OtherFoods)
                        }
                    }
                    .padding(10)
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
