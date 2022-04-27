//
//  LocalNotificationManager.swift
//  Water_Reminder
//
//  Created by Daniil on 27.04.2022.
//

import SwiftUI

class LocalNotificationManager
{
    init()
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            if success == true
            {
                print("Request Authorization Notification Complited")
            }
            else
            {
                print("Request Authorization Notification Don't Complited")
            }
        }
    }
    
    func sendNotification(remaindValue: Int, wakeUpTime: String)
    {

        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        
        let content = UNMutableNotificationContent()
        
        content.title = "Water Reminder"
        content.subtitle = "You should drink some water)"
        content.sound = .default
        content.badge = 1
        
        let wakeUpHour = Int(wakeUpTime[...wakeUpTime.index(wakeUpTime.startIndex, offsetBy: 1)])!
        var newWakeUpHour = wakeUpHour
        let wakeUpMinutes = Int(wakeUpTime[wakeUpTime.index(wakeUpTime.startIndex, offsetBy: 3)...wakeUpTime.index(wakeUpTime.startIndex, offsetBy: 4)])!
        
        

        while newWakeUpHour <= wakeUpHour + 16
        {
            var dateComponents = DateComponents()
            dateComponents.hour = (newWakeUpHour % 24)
            dateComponents.minute = wakeUpMinutes
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            newWakeUpHour += remaindValue

        }
        
    }
}
