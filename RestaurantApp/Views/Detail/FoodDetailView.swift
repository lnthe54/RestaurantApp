//
//  FoodDetailView.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/29.
//

import SwiftUI
import AlertToast

struct FoodDetailView: View {
    // MARK: - PROPERTY
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: FoodDetailViewModel
    @Binding var isAddItem: Bool
    @Binding var itemOfCart: Int
    @State var food: FoodOject
    @State private var isAnim: Bool = false
    @State private var counter: Int = 0
    @State private var isEmptyFood: Bool = false
    
    var body: some View {
        // MARK: - VSTACK
        VStack {
            // MARK: - TOOLBAR
            HStack(alignment: .center, spacing: 16) {
                // MARK: - BACK BUTTON
                Button {
                    // Action
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                }
                .foregroundColor(.black)
                Spacer()
            }
            .padding()
            .padding(.top, 44)
            
            // MARK: - CONTENT
            VStack(alignment: .center, spacing: 0) {
                
                // MARK: - IMAGE
                Image(food.image)
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnim ? 0 : -35)
                    .frame(width: 200, height: 200)
            
                ScrollView(showsIndicators: false) {
                    VStack {
                        Text(food.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text(food.headline)
                            .font(.system(size: 12))
                            .foregroundColor(Constant.color212121)
                        
                        Spacer()
                        
                        // MARK: - RATING VIEW
                        HStack(spacing: 5) {
                            ForEach(0..<food.stars) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        } // MARK: - END RATING VIEW
                        
                        VStack(alignment: .leading) {
                            Text("Mô tả")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Constant.colorPimary)
                            
                            Spacer()
                            
                            Text(food.description)
                                .font(.system(size: 16))
                                .foregroundColor(Constant.color212121)
                            
                            Spacer()
                            
                            // MARK: - PRICE VIEW
                            HStack(alignment: .center, spacing: 5) {
                                Text("Giá tiền")
                                    .foregroundColor(Constant.colorPimary)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Spacer()
                                
                                Text(food.price.convertToString())
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Constant.color212121)
                                
                                Text("VND")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Constant.color212121)
                            }
                            .padding(.top)
                            
                            // MARK: - QUANTITY BUTTON
                            HStack(alignment: .center, spacing: 12) {
                                
                                Text("Số lượng")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Constant.colorPimary)
                                
                                Spacer()
                                
                                // MARK: - MINUS BUTTON
                                Button {
                                    if counter > 0 {
                                        counter -= 1
                                    }
                                } label: {
                                    ZStack {
                                        Image(systemName: "minus")
                                            .foregroundColor(.black)
                                    }
                                    .padding(6)
                                    .foregroundColor(.black)
                                }

                                ZStack {
                                    Text("\(counter)")
                                        .font(.body)
                                        .fontWeight(.bold)
                                }
                                .padding(6)
                                .foregroundColor(.white)
                                .background(Constant.colorPimary)
                                .cornerRadius(4)
                                .frame(width: 40, height: 40, alignment: .center)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                
                                // MARK: - PLUS BUTTON
                                Button {
                                    if counter < 100 {
                                        counter += 1
                                    }
                                } label: {
                                    ZStack {
                                        Image(systemName: "plus")
                                            .foregroundColor(.black)
                                    }
                                    .padding(6)
                                    .foregroundColor(.black)
                                }
                            }
                        }
                        .padding()
                    }
                }
                
               // MARK: - ADD TO CART
                Button {
                    // Action
                    if counter == 0 {
                        self.isEmptyFood.toggle()
                        return
                    }
                    
                    self.isAddItem = true
                    self.viewModel.addFoodToCart(food, quantity: counter)
                    self.itemOfCart = UserDataDefaults.shared.getCartFoods().count
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Spacer()
                    Text("Thêm vào giỏ hàng".uppercased())
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(16)
                .background(counter == 0 ? .gray : Constant.colorPimary)
                .cornerRadius(12)
                .frame(width: 260, alignment: .center)
                .shadow(color: .gray, radius: 4, x: 0, y: 2)
                .padding()
                
                Spacer()
            }
            
            Spacer()
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.8)) {
                isAnim.toggle()
            }
        }
        .background(Constant.colorEFEFEF)
        .edgesIgnoringSafeArea([.top, .bottom])
        .toast(isPresenting: $isEmptyFood) {
            AlertToast(displayMode: .hud,
                       type: .error(Constant.colorPimary),
                       title: "Bạn chưa chọn món ăn!")
        }
    }
}

//struct FoodDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodDetailView(viewModel: FoodDetailViewModel(), food: Constant.AllFoods[0])
//    }
//}
