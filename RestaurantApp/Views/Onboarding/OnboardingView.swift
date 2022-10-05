//
//  OnboardingView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/29.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - PROPERTY
    @ObservedObject var viewModel: OnboardingViewModel
    @State private var isOpenHome: Bool = false
    @State private var pageIndex: Int = 0
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(viewModel.pages) { page in
                VStack {
                    Spacer()
                    IntroView(page: page)
                    Spacer()

                    if page == viewModel.pages.last {
//                        Button {
//                            // Action
//                            UserDataDefaults.shared.isFirstInstall = true
//                            isOpenHome = true
//                        } label: {
//                            Text("Bắt đầu")
//                                .font(.headline)
//                                .frame(width: 200, height: 40, alignment: .center)
//                                .foregroundColor(.white)
//                                .background(Constant.colorPimary)
//                                .cornerRadius(10)
//                        }
//                        .padding(.bottom, 30)
//                        .fullScreenCover(isPresented: $isOpenHome) {
//                            HomeView(viewModel: HomeViewModel())
//                        }
                        NavigationLink {
                            HomeView(viewModel: HomeViewModel())
                                .navigationBarHidden(true)
                        } label: {
                            Text("Bắt đầu")
                                .font(.headline)
                                .frame(width: 200, height: 40, alignment: .center)
                                .foregroundColor(.white)
                                .background(Constant.colorPimary)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 30)
                    }

                    Spacer()
                }
                .tag(page.tag)
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = UIColor(Constant.colorPimary)
            dotAppearance.pageIndicatorTintColor = .gray
        }
    }
    
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToZero() {
        pageIndex = 0
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel())
    }
}
