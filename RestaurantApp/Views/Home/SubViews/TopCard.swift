//
//  TopCard.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import SwiftUI

struct TopCard: View {
    
    // MARK: - PROPERTY
    let food: FoodOject
    @State private var isOpenDetail: Bool = false

    var body: some View {
        
        // MARK: - VSTACK
        VStack {
            // MARK: - HSTACK
            HStack {
                Spacer()
                
                // MARK: - VSTACK CONTENT
                VStack(alignment: .center, spacing: 12) {
                    // MARK: - HEAD LINE
                    Text(food.headline)
                        .font(.subheadline)
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                    
                    // MARK: - BUY NOW BUTTON
                    Button {
                        // Action
                        self.isOpenDetail = true
                    } label: {
                        // MARK: - BUY NOW ZSTACK
                        ZStack {
                            Text(" Mua ngay ")
                                .font(.body)
                                .fontWeight(.bold)
                        } // MARK: - END BUY NOW ZSTACK
                        .padding(6)
                        .foregroundColor(Constant.colorPimary)
                        .background(Color.white)
                        .cornerRadius(100)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    }
                    .padding(.bottom, 4)
                    .fullScreenCover(isPresented: $isOpenDetail) {
                        FoodDetailView(food: food)
                    }
                } // MARK: - END VSTACK CONTENT
                
                // MARK: - IMAGE
                Image(food.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120, alignment: .center)
                
                Spacer()
            } // MARK: - END HSTACK
            .background(Constant.colorSubPimary.clipShape(RoundedRectangle(cornerRadius: 6)))
            .shadow(radius: 2)
            .padding(8)
        } // MARK: - END VSTACK
    }
}

struct TopCard_Previews: PreviewProvider {
    static var previews: some View {
        TopCard(food: Constant.FeaturedFoods[0])
            .previewLayout(.sizeThatFits)
    }
}
