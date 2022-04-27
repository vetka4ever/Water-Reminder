//
//  SettingNotificationPresenter.swift
//  Water_Reminder
//
//  Created by Daniil on 27.04.2022.
//

import Foundation
class SettingNotificationPresenter: ObservableObject
{
    private var model = LocalStorage()
    private var notificationCenter: LocalNotificationManager
    {
        return LocalNotificationManager()
    }
    
    func getRemainderHours() -> [(Int, String)]
    {
        return model.getRemainderHours()
    }
    
    func saveRemaindValue(remaindValue: Int)
    {
        model.saveData(data: remaindValue, typeOfdata: .RemindValue)
        notificationCenter.sendNotification(remaindValue: (model.getData(typeOfData: .RemindValue) as! Int), wakeUpTime: (model.getData(typeOfData: .WakeUpTime) as! String))
    }
}
