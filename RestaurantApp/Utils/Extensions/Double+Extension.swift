//
//  Double+Extension.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/10/06.
//

import Foundation

extension Double {
    func convertToString() -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3

        return formatter.string(for: self) ?? ""
    }
}

extension Int {
    func convertToString() -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3

        return formatter.string(for: self) ?? ""
    }
}
