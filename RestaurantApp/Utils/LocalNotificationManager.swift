//
//  LocalNotificationManager.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/10/23.
//

import Foundation
import SwiftUI

class LocalNotificationManager: ObservableObject {
    
    var notifications = [Notification]()
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted == true && error == nil {
                print("Notifications permitted")
                self.sendNotification()
            } else {
                print("Notifications not permitted")
            }
        }
    }
    
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Order ngay thôi!"
        content.body = "Let’s order \ncuối tuần trọn vẹn bên người thân với những món ăn của...vào app order ngay"
        
        let listAllMonday: [Date] = Date().getNextTenMonday()
        listAllMonday.forEach { date in
            addRemindUserNotification(yearSchedule: date.year,
                                      monthSchedule: date.month,
                                      dateSchedule: date.day,
                                      hourSchedule: 9,
                                      minuteSchedule: 0,
                                      content: content)
        }
    }
    
    /// add remind for user using features app
    private func addRemindUserNotification(yearSchedule: Int,
                                           monthSchedule: Int,
                                           dateSchedule: Int,
                                           hourSchedule: Int,
                                           minuteSchedule: Int,
                                           content: UNMutableNotificationContent) {
        let dateComponent = DateComponents.calculateDateComponents(yearSchedule: yearSchedule,
                                                                   monthSchedule: monthSchedule,
                                                                   dateSchedule: dateSchedule,
                                                                   hourSchedule: hourSchedule,
                                                                   minuteSchedule: minuteSchedule)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent,
                                                    repeats: false)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: "\(uuidString)",
                                            content: content,
                                            trigger: trigger)
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                // Handle any errors.
            }
        }
    }
}
