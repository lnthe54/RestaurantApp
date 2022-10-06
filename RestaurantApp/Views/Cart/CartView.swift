//
//  CartView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/10/05.
//

import SwiftUI

struct CartView: View {
    // MARK: - PROPERTY
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var cartViewModel: CartViewModel
    @Binding var itemOfCart: Int
    
    var body: some View {
        // MARK: - VSTACK
        VStack {
            // MARK: - TOOLBAR
            HStack(alignment: .center, spacing: 10) {
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

                Text("Giỏ hàng của tôi")
                    .font(.title2)
                    .fontWeight(.bold)

                Spacer()

            } // MARK: - END TOOLBAR
            .padding()
            .padding(.top, 44)
            
            if cartViewModel.cartFoods.count > 0 {
                List {
                    ForEach(cartViewModel.cartFoods) { cart in
                        ItemCartView(cartViewModel: cartViewModel,
                                     cart: cart,
                                     totalMoney: self.$cartViewModel.totalMoney)
                            .buttonStyle(.plain)
                    }
                    .onDelete { index in
                        self.cartViewModel.deleteFood(at: index)
                        self.itemOfCart = UserDataDefaults.shared.getCartFoods().count
                    }
                }
                .listStyle(.plain)
                
                // MARK: - BUY VIEW
                VStack {
                    HStack {
                        Text("Tổng tiền")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Constant.colorPimary)

                        Spacer()

                        Text("\(cartViewModel.totalMoney.convertToString()) VNĐ")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Constant.colorPimary)
                    }
                    .padding(6)

                    Button {
                        // Action

                    } label: {
                        Spacer()
                        Text("Mua hàng".uppercased())
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(16)
                    .background(Constant.colorPimary)
                    .cornerRadius(12)
                    .shadow(color: .gray, radius: 4, x: 0, y: 2)
                    .padding(.bottom)
                    .padding(6)
                } // MARK: - END BUY VIEW
            } else {
                
                Spacer()
                VStack(alignment: .center) {
                    Image("chef_sad")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Text("Tiếc quá, chưa có món ăn trong giỏ hàng của bạn \n Vui lòng thêm món ăn vào nhé!")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(Constant.colorPimary)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                Spacer()
            }
            
            Spacer()
        }
        .onAppear {
            cartViewModel.onAppear()
        }
        .background(Constant.colorEFEFEF)
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}
