//
//  SettingTimePresenter.swift
//  Water_Reminder
//
//  Created by Daniil on 17.04.2022.
//

import Foundation
class SettingTimePresenter: ObservableObject
{
    private var model = LocalStorage()
    private var notificationCenter: LocalNotificationManager
    {
        return LocalNotificationManager()
    }
    @Published var currentDate = Date()
    
    init()
    {
        let calendar = DateFormatter()
        calendar.dateFormat = "HH:mm"
        let currentDateString =  model.getData(typeOfData: .WakeUpTime) as! String
        currentDate = calendar.date(from: currentDateString)!
    }
    
    func saveNewDate()
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        model.saveData(data: formatter.string(from: currentDate), typeOfdata: .WakeUpTime)
        notificationCenter.sendNotification(remaindValue: (model.getData(typeOfData: .RemindValue) as! Int), wakeUpTime: (model.getData(typeOfData: .WakeUpTime) as! String))

    }
    
    
    
}
