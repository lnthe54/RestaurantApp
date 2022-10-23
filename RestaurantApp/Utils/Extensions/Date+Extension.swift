//
//  Date+Extension.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/10/23.
//

import Foundation

extension DateComponents {
    
    /// Calculate DateComponents
    /// - Parameters:
    ///   - yearSchedule: year of schedule
    ///   - monthSchedule: month of schedule
    ///   - dateSchedule: date of schedule
    ///   - hourSchedule: hour of schedule
    ///   - minuteSchedule: minute schedule
    /// - Returns: DateComponents of schedule
    static func calculateDateComponents(yearSchedule: Int,
                                        monthSchedule: Int,
                                        dateSchedule: Int,
                                        hourSchedule: Int,
                                        minuteSchedule: Int) -> DateComponents {
        let date = Date()
        let calendar = Calendar.current

        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        
        dateComponents.setValue(yearSchedule, for: .year)
        dateComponents.setValue(monthSchedule, for: .month)
        dateComponents.setValue(dateSchedule, for: .day)
        dateComponents.setValue(hourSchedule, for: .hour)
        dateComponents.setValue(minuteSchedule, for: .minute)
        
        return dateComponents
    }
}

extension Date {
    var isSunday: Bool {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "EEE"
         dateFormatter.locale = Locale(identifier: "en_US_POSIX")
         let str = dateFormatter.string(from: self).uppercased()
         return str == "SUN"
     }
    
    func getNextTenMonday() -> [Date] {
        var listAllMonday: [Date] = []
        var currentDate = Date()
        var dateComponent = DateComponents()
        let calender = Calendar.current
        dateComponent.year = 1
        let futureDate = calender.date(byAdding: dateComponent, to: currentDate)
        
        while currentDate <= futureDate ?? Date() {
            if currentDate.isSunday && listAllMonday.count < 60 {
                listAllMonday.append(currentDate)
            }
            guard let newDate = calender.date(byAdding: .day,
                                              value: 1,
                                              to: currentDate) else {
                break
            }
            currentDate = newDate
        }
        return listAllMonday
    }
    
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
    
    var month: Int {
        Calendar.current.component(.month, from: self)
    }
    
    var year: Int {
        Calendar.current.component(.year, from: self)
    }
}
