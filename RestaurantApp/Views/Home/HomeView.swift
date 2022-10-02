//
//  HomeView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        // MARK: - VSTACK
        VStack {
            // MARK: - TOOL BAR
            HomeToolBar()
                .padding(8)
                .padding(.top, 56)
            
            // MARK: - TITLE
            HStack {
                Text("What would you \n like to eat?")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            } // MARK: - END TITLE
            .padding(8)
            
            // MARK: - SUB CONTENT
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    FeatureFoodView()
                        .frame(height: 135)
                        .padding(12)
                        .environmentObject(viewModel)
                    
                    PopularFoodView()
                        .padding()
                        .environmentObject(viewModel)
                }
            }
            
            Spacer()
            
        } // MARK: - END VSTACK
        .background(Constant.colorEFEFEF)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
