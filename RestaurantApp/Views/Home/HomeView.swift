//
//  HomeView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI
import AlertToast

struct HomeView: View {
    
    // MARK: - Property
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        // MARK: - VSTACK
        VStack {
            // MARK: - TOOL BAR
            HomeToolBar(viewModel: viewModel, itemCart: $viewModel.itemOfCart)
                .padding(8)
                .padding(.top, 56)
            
            // MARK: - TITLE
            HStack {
                Text("Bạn muốn ăn gì?")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            } // MARK: - END TITLE
            .padding(8)
            
            // MARK: - SUB CONTENT
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    FeatureFoodView(viewModel: viewModel)
                        .frame(height: 145)
                    
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
        .toast(isPresenting: self.$viewModel.isAddItem) {
            AlertToast(displayMode: .hud,
                       type: .complete(.green),
                       title: "Thêm món ăn thành công!")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
