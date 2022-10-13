//
//  LoadingView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/10/12.
//

import SwiftUI

struct LoadingView: View {
    
    // MARK: - Property
    @Binding var isVisible: Bool

    init(isVisible: Binding<Bool>) {
        _isVisible = isVisible
    }
    
    var body: some View {
        if isVisible {
            loadingView
        } else {
            EmptyView()
        }
    }
    
    // MARK: - Private
    private var loadingView: some View {
        ZStack {
            RotatingDotsLoadingView(count: 5)
        }
    }
}

// MARK: - SUBVIEW
struct RotatingDotsLoadingView: View {

    let count: Int

    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<count, id: \.self) { index in
                RotatingDotsIndicatorItemView(index: index, size: geometry.size)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct RotatingDotsIndicatorItemView: View {

    let index: Int
    let size: CGSize

    @State private var scale: CGFloat = 0
    @State private var rotation: Double = 0

    var body: some View {
        let animation = Animation
            .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
            .repeatForever(autoreverses: false)

        return Circle()
            .frame(width: size.width / 5, height: size.height / 5)
            .scaleEffect(scale)
            .offset(y: size.width / 10 - size.height / 2)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                rotation = 0
                scale = (5 - CGFloat(index)) / 5
                withAnimation(animation) {
                    rotation = 360
                    scale = (1 + CGFloat(index)) / 5
                }
            }
    }
}
