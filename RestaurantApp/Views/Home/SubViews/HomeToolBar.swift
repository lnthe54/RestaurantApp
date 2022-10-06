//
//  HomeToolBar.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct HomeToolBar: View {
    
    // MARK: - PROPERTY
    @ObservedObject var viewModel: HomeViewModel
        
    @State var isOpenCart: Bool = false
    @Binding var itemCart: Int
    var hihi: Int = 0
    
    // MARK: - BODY
    var body: some View {
        
        // MARK: - HSTACK
        HStack(alignment: .center, spacing: 16) {
            let timeText: String = self.viewModel.timeText
            
            Text("\(timeText), Bạn!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Spacer()
            
            // MARK: - CART BUTTON
            NavigationLink {
                // Open cart view
                CartView(cartViewModel: CartViewModel(), itemOfCart: $itemCart)
                    .navigationBarHidden(true)
            } label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title2)
                    
                    if self.itemCart > 0 {
                        ZStack {
                            Circle()
                                .fill(Color.red)
                                .frame(maxWidth: 20)
                            Text("\(self.itemCart)")
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 20, height: 20, alignment: .topLeading)
                        .padding([.bottom, .trailing])
                    }
                }
            }
            .foregroundColor(.black)
        } // MARK: - END HSTACK
    }
}
