//
//  IntroView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/29.
//

import SwiftUI

struct IntroView: View {
    // MARK: - PROPERTY
    var page: PageObject
    private let width: CGFloat = UIScreen.main.bounds.width * 0.8
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(page.image)
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
                .background(Constant.colorSubPimary.opacity(0.5))
                .cornerRadius(10)
                .padding()
            
            Text(page.title)
                .font(.system(size: 24))
                .bold()
                .frame(width: width)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(page.description)
                .font(.subheadline)
                .frame(width: width)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
