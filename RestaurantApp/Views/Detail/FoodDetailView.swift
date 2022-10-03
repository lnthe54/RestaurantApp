//
//  FoodDetailView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/29.
//

import SwiftUI

struct FoodDetailView: View {
    // MARK: - PROPERTY
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let food: FoodOject
    
    @State private var isAnim: Bool = false
    
    var body: some View {
        // MARK: - VSTACK
        VStack {
            // MARK: - TOOLBAR
            HStack(alignment: .center, spacing: 16) {
                // MARK: - BACK BUTTON
                Button {
                    // Action
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                }
                .foregroundColor(.black)
                Spacer()
            }
            .padding()
            .padding(.top, 44)
            
            // MARK: - CONTENT
            VStack(alignment: .center, spacing: 0) {
                
                // MARK: - IMAGE
                Image(food.image)
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnim ? 0 : -35)
                    .frame(width: 200, height: 200)
            
                ScrollView(showsIndicators: false) {
                    // MARK: - HEADER
                    HeaderView(food: food)
                        .padding()
                    
                    HStack(alignment: .center, spacing: 0) {
                        Text("VND")
                            .foregroundColor(Constant.colorPimary)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(food.price)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    // MARK: - QUANTITY BUTTON
                    QuantityView()
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
        FoodDetailView(food: Constant.FeaturedFoods[0])
    }
}
