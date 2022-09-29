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
    
    var body: some View {
        if !shop.showingFood && shop.selectedFood == nil {
            HomeView()
        } else {
            FoodDetailView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
