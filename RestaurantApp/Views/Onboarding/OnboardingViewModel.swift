//
//  OnboardingViewModel.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/30.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    @Published var pages: [PageObject] = []
    
    init() {
        getListPage()
    }
    
    private func getListPage() {
        self.pages = [
            PageObject(id: 0,
                 image: "welcome",
                 title: "Chào mừng đến nhà hàng",
                 description: "Chúng tôi giúp bạn dễ dàng tìm thấy món ăn mà bạn Muốn. Chọn món ăn và để chúng tôi làm phần còn lại.",
                 tag: 0),
            PageObject(id: 1,
                 image: "chef",
                 title: "Hãy chọn một món ăn ngon",
                 description: "Chúng tôi giúp bạn dễ dàng tìm thấy món ăn mà bạn Muốn. Chọn món ăn và để chúng tôi làm phần còn lại.",
                 tag: 1),
            PageObject(id: 2,
                 image: "cooking",
                 title: "Món ăn đang chế biến",
                 description: "Chúng tôi giúp bạn dễ dàng tìm thấy món ăn mà bạn Muốn. Chọn món ăn và để chúng tôi làm phần còn lại.",
                 tag: 2)
        ]
    }
}
