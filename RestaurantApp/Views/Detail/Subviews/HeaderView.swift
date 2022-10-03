//
//  HeaderView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/29.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTY
    let food: FoodOject
    
    var body: some View {
        VStack {
            Text(food.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text(food.description)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(food: Constant.FeaturedFoods[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
