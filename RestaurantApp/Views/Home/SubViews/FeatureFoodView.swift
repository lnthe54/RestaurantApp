//
//  FeatureFoodView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct FeatureFoodView: View {
    
    // MARK: - Property
    @ObservedObject var viewModel: HomeViewModel
    @State var slide = 1
    @State var forward = true
    private let dotAppearance = UIPageControl.appearance()

    var body: some View {
        // MARK: - VSTACK
        VStack {
            TabView(selection: $slide) {
                ForEach(viewModel.foodsBanner) { food in
                    TopCard(homeViewModel: viewModel, food: food)
                        .tag(food.id)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onAppear {
                autoSwitchTab()
            }
            
            Spacer()
            
            HStack(alignment: .center, spacing: 3) {
                ForEach(0..<viewModel.foodsBanner.count, id: \.self) { index in
                    if (self.slide - 1) == index {
                        Image(systemName: "minus")
                            .foregroundColor(Constant.colorPimary)
                    } else {
                        Image(systemName: "minus")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
    
    private func autoSwitchTab() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
            if forward {
                slide += 1
                if slide == viewModel.foodsBanner.count + 1 {
                    forward = false
                }
            } else {
                slide = 1
                forward = true
            }
        }
    }
}

struct FeatureFoodView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureFoodView(viewModel: HomeViewModel())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
