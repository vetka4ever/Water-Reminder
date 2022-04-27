//
//  RemaindMePresenter.swift
//  Water_Reminder
//
//  Created by Daniil on 25.04.2022.
//

import Foundation
class RemaindMePresenter
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
        model.saveData(data: 0, typeOfdata: .CapacityOfCup)
        model.saveData(data: 0, typeOfdata: .CapacityOfGlass)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        let dateOfGoal = dateFormatter.string(from: Date())
        
        model.saveData(data: dateOfGoal, typeOfdata: .DateOfGoal)
        model.saveData(data: true, typeOfdata: .FirstSettingIsComplite)
        
        notificationCenter.sendNotification(remaindValue: (model.getData(typeOfData: .RemindValue) as! Int), wakeUpTime: (model.getData(typeOfData: .WakeUpTime) as! String))
       
    }
}
