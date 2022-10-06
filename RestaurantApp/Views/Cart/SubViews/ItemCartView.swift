//
//  ItemCartView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/10/05.
//

import SwiftUI

struct ItemCartView: View {
    
    // MARK: - PROPERTY
    @ObservedObject var cartViewModel: CartViewModel
    @State var isChange: Bool = false
    let cart: CartObject
    @State var quantity: Int = 0
    @Binding var totalMoney: Double
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Image(cart.image)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .padding(.leading, 8)
            
            VStack(alignment: .leading) {
                Text("\(cart.name)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Constant.color212121)
                    .padding(.top, 8)
            
                Text("\(cart.price.convertToString()) vnđ")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(Constant.colorPimary)
                
                Spacer()
            }
            .padding(.leading, 10)
            
            Spacer()

            // MARK: - QUANTITY
            HStack(alignment: .center, spacing: 0) {
                // MARK: - MINUS BUTTON
                Button {
                    if cart.quantity > 1 {
                        changeFood(false, cart: cart)
                    }
                } label: {
                    ZStack {
                        Image(systemName: "minus")
                            .foregroundColor(.black)
                    }
                    .padding(6)
                    .foregroundColor(.black)
                }

                ZStack {
                    Text("\(isChange ? quantity : cart.quantity)")
                    .font(.system(size: 12))
                        .fontWeight(.bold)
                }
                .padding(6)
                .foregroundColor(.white)
                .background(Constant.colorPimary)
                .cornerRadius(4)
                .frame(width: 40, height: 40, alignment: .center)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                
                // MARK: - PLUS BUTTON
                Button {
                    if cart.quantity > 100 {
                        return
                    } else {
                        changeFood(true, cart: cart)
                    }
                } label: {
                    ZStack {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                    .padding(6)
                    .foregroundColor(.black)
                }
            }
            .padding(.trailing, 8)
        } // MARK: - END HSTACK
        .padding()
    }
    
    private func changeFood(_ isIncrease: Bool, cart: CartObject) {
        if isIncrease {
            cart.quantity += 1
        } else {
            cart.quantity -= 1
        }
        cartViewModel.updateFood(cart, quantity: cart.quantity)
        quantity = cart.quantity
        isChange = true
        totalMoney = cartViewModel.getTotalMoney()
    }
}

//struct ItemCartView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemCartView(cartViewModel: CartViewModel(),
//                     cart: CartObject(id: 1, name: "Test", image: "pizza", price: 200, quantity: 20))
//            .previewLayout(.sizeThatFits)
//    }
//}
