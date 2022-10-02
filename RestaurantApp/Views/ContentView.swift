//
//  ContentView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTY
    @EnvironmentObject var shop: Shop
    private let isFirstInstall: Bool = UserDataDefaults.shared.isFirstInstall

    var body: some View {
        if isFirstInstall {
            if !shop.showingFood && shop.selectedFood == nil {
                HomeView(viewModel: HomeViewModel())
            } else {
                FoodDetailView()
            }
        } else {
            OnboardingView(viewModel: .init())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
