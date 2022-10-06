//
//  FoodTypeModel.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/09/28.
//

import Foundation

struct FoodOject: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let headline: String
    var stars: Int
    let price: String
    let description: String
    var quantity: Int?
}

class CartObject: NSObject, NSCoding, Identifiable {
    
    let id: Int
    let name: String
    let image: String
    let price: String
    var quantity: Int
    
    init(id: Int, name: String, image: String, price: String, quantity: Int) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.quantity = quantity
    }
    
    required convenience init?(coder: NSCoder) {
        let id = coder.decodeInteger(forKey: "id")
        let name = coder.decodeObject(forKey: "name") as! String
        let image = coder.decodeObject(forKey: "image") as! String
        let price = coder.decodeObject(forKey: "price") as! String
        let quantity = coder.decodeInteger(forKey: "quantity")
        
        self.init(id: id, name: name, image: image, price: price, quantity: quantity)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(image, forKey: "image")
        coder.encode(price, forKey: "price")
        coder.encode(quantity, forKey: "quantity")
    }
}
