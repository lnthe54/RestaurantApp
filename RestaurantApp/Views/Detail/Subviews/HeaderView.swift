//
//  HeaderView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/29.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTY
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        VStack {
            Text((shop.selectedFood?.name ?? UserDefaults.standard.string(forKey: "name"))!)
                .font(.title)
                .fontWeight(.bold)
            
            Text((shop.selectedFood?.description ?? UserDefaults.standard.string(forKey: "description"))!)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
