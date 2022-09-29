//
//  QualityView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/29.
//

import SwiftUI

struct QualityView: View {
    // MARK: - PROPERTY
    @State private var backgroundColor: [Color] = [Color.white, Constant.colorPimary, Color.white]
    @State private var foregroundColor: [Color] = [.black, .white, .black]
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            // MARK: - R BUTTON
            Button {
                // Action
                backgroundColor[0] = Constant.colorPimary
                backgroundColor[1] = .white
                backgroundColor[2] = .white
                
                foregroundColor[0] = .white
                foregroundColor[1] = .black
                foregroundColor[2] = .black
            } label: {
                ZStack {
                    Text("R")
                        .font(.body)
                        .fontWeight(.bold)
                }
                .padding(6)
                .foregroundColor(foregroundColor[0])
                .background(backgroundColor[0])
                .cornerRadius(4)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            }
            
            // MARK: - M BUTTON
            Button {
                // Action
                backgroundColor[0] = .white
                backgroundColor[1] = Constant.colorPimary
                backgroundColor[2] = .white
                
                foregroundColor[0] = .black
                foregroundColor[1] = .white
                foregroundColor[2] = .black
            } label: {
                ZStack {
                    Text("M")
                        .font(.body)
                        .fontWeight(.bold)
                }
                .padding(6)
                .foregroundColor(foregroundColor[1])
                .background(backgroundColor[1])
                .cornerRadius(4)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            }

            // MARK: - L BUTTON
            Button {
                // Action
                backgroundColor[0] = .white
                backgroundColor[1] = .white
                backgroundColor[2] = Constant.colorPimary
                
                foregroundColor[0] = .black
                foregroundColor[1] = .black
                foregroundColor[2] = .white
            } label: {
                ZStack {
                    Text("L")
                        .font(.body)
                        .fontWeight(.bold)
                }
                .padding(6)
                .foregroundColor(foregroundColor[2])
                .background(backgroundColor[2])
                .cornerRadius(4)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            }

        }
        .padding(.top)
    }
}

struct QualityView_Previews: PreviewProvider {
    static var previews: some View {
        QualityView()
            .previewLayout(.sizeThatFits)
    }
}
