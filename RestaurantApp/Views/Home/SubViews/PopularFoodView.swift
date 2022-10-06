//
//  PopularView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI
import AlertToast

struct PopularFoodView: View {
    // MARK: - PROPERTY
    @ObservedObject var homeViewModel: HomeViewModel
        
    var gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
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
                        NavigationLink {
                            FoodDetailView(viewModel: FoodDetailViewModel(), isAddItem: self.$homeViewModel.isAddItem, itemOfCart: self.$homeViewModel.itemOfCart, food: food)
                                .navigationBarHidden(true)
                        } label: {
                            FoodVerticalView(homeViewModel: homeViewModel,
                                             food: food)
                                .background(Color.white.clipShape(CornerRadiusShape()))
                                .shadow(radius: 4)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularFoodView(homeViewModel: HomeViewModel())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
