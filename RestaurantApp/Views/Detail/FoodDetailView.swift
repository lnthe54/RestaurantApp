//
//  FoodDetailView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/29.
//

import SwiftUI

struct FoodDetailView: View {
    // MARK: - PROPERTY
    @EnvironmentObject var shop: Shop
    @State private var isAnim: Bool = false
    
    var body: some View {
        // MARK: - VSTACK
        VStack {
            // MARK: - TOOLBAR
            DetailToolBar()
                .padding()
                .padding(.top, 44)
            
            // MARK: - CONTENT
            VStack(alignment: .center, spacing: 0) {
                
                // MARK: - IMAGE
                Image((shop.selectedFood?.image ?? UserDefaults.standard.string(forKey: "image"))!)
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnim ? 0 : -35)
                    .frame(width: 200, height: 200)
            
                ScrollView(showsIndicators: false) {
                    // MARK: - HEADER
                    HeaderView()
                        .padding()
                    
                    HStack(alignment: .center, spacing: 0) {
                        Text("$")
                            .foregroundColor(Constant.colorPimary)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text((shop.selectedFood?.price ?? UserDefaults.standard.string(forKey: "price"))!)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    // MARK: - QUALITY BUTTON
    //                QualityView()
    //                    .padding()
                    
                    // MARK: - QUANTITY BUTTON
                    QuantityView()
    //                    .padding()
                }
                
               // MARK: - ADD TO CART
                AddToCartView()
                    .frame(width: 260, alignment: .center)
                    .shadow(color: .gray, radius: 4, x: 0, y: 2)
                    .padding()
            }
            
            Spacer()
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.8)) {
                isAnim.toggle()
            }
        }
        .background(Constant.colorEFEFEF)
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView()
            .environmentObject(Shop())
    }
}
