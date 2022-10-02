//
//  FeatureFoodView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct FeatureFoodView: View {
    
    // MARK: - Property
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        // MARK: - ZSTACK
        ZStack {
            TabView {
                ForEach(viewModel.foodsBanner) { food in
                    TopCard(food: food)
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct FeatureFoodView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureFoodView()
            .environmentObject(HomeViewModel())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
