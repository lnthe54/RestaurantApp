//
//  HomeToolBar.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct HomeToolBar: View {
    
    // MARK: - PROPERTY
    
    // MARK: - BODY
    var body: some View {
        
        // MARK: - HSTACK
        HStack(alignment: .center, spacing: 16) {
            
            Text("Chào buổi sáng, Bạn!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Spacer()
            
            // MARK: - CART BUTTON
            Button {
                // Action
            } label: {
                Image(systemName: "cart")
                    .font(.title2)
            } // MARK: - END SEARCH BUTTON
            .foregroundColor(.black)


        } // MARK: - END HSTACK
    }
}

struct HomeToolBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeToolBar()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
