//
//  AddToCartView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/29.
//

import SwiftUI

struct AddToCartView: View {
    var body: some View {
        Button {
            
        } label: {
            Spacer()
            Text("Thêm vào giỏ hàng".uppercased())
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(16)
        .background(Constant.colorPimary)
        .cornerRadius(12)
    }
}

struct AddToCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartView()
    }
}
