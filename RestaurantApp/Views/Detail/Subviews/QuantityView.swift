//
//  QuantityView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/29.
//

import SwiftUI

struct QuantityView: View {
    // MARK: - PROPERTY
    @State private var counter: Int = 0
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            
            // MARK: - MINUS BUTTON
            Button {
                if counter > 0 {
                    counter -= 1
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
                Text("\(counter)")
                    .font(.body)
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
                if counter < 100 {
                    counter += 1
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
        .padding(.top)
    }
}

struct QuantityView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityView().previewLayout(.sizeThatFits)
    }
}
