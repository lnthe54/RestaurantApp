//
//  DetailToolBar.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/29.
//

import SwiftUI

enum TypeHeart: String {
    case active = "heart.fill"
    case deactive = "heart"
}

struct DetailToolBar: View {
    
    // MARK: - PROPERTY
    @EnvironmentObject var shop: Shop
    @State var isFavorite: Bool = false
    @State private var favIcon: TypeHeart = .deactive
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            // MARK: - BACK BUTTON
            Button {
                // Action
                withAnimation(.easeInOut(duration: 0.5)) {
                    shop.showingFood = false
                    shop.selectedFood = nil
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
            }
            .foregroundColor(.black)
            
            Spacer()
            
            // MARK: - HEART BUTTON
            Button {
                // Action
                if isFavorite {
                    favIcon = .active
                    isFavorite = false
                } else {
                    favIcon = .deactive
                    isFavorite = true
                }
            } label: {
                if favIcon == .deactive {
                    Image(systemName: favIcon.rawValue)
                        .font(.title)
                        .foregroundColor(.black)
                } else {
                    Image(systemName: favIcon.rawValue)
                        .font(.title)
                        .foregroundColor(.red)
                }
            }
            .foregroundColor(.black)
        }
    }
}

struct DetailToolBar_Previews: PreviewProvider {
    static var previews: some View {
        DetailToolBar()
            .environmentObject(Shop())
    }
}
