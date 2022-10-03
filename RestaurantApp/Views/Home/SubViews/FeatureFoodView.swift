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
    @State var slide = 1
    @State var forward = true
    
    var body: some View {
        // MARK: - ZSTACK
        TabView(selection: $slide) {
            ForEach(viewModel.foodsBanner) { food in
                TopCard(food: food)
                    .tag(food.id)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .onAppear {
            autoSwitchTab()
        }
    }
    
    private func autoSwitchTab() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
            if forward {
                slide += 1
                if slide == viewModel.foodsBanner.count {
                    forward = false
                }
            } else {
                slide -= 1
                if slide == 0 {
                    forward = true
                }
            }
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
