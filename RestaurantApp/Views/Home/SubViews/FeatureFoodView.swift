//
//  FeatureFoodView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct FeatureFoodView: View {
    var body: some View {
        // MARK: - ZSTACK
        ZStack {
            TabView {
                ForEach(Constant.FeaturedFoods) { food in
                    TopCard(foodModel: food)
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct FeatureFoodView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureFoodView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
