//
//  SettingPresenter.swift
//  Water_Reminder
//
//  Created by Daniil on 13.04.2022.
//

import SwiftUI

class SettingPresenter: ObservableObject
{
    private var model = LocalStorage()
    
    enum TypeOfData: Int
    {
        case WakeUpTime  = 0
        case DailyGoal
        case CapacityOfCup
        case CapacityOfGlass
        case Notification
    }
        
    init()
    {
        updateValues()
    }
    
    @Published var data: [Int:(String,String)] = [
        TypeOfData.DailyGoal.rawValue : ("Daily goal",""),
        TypeOfData.WakeUpTime.rawValue : ("Wake up time", ""),
        TypeOfData.Notification.rawValue : ("Notification"," "),
        TypeOfData.CapacityOfCup.rawValue : ("Capacity of cup",""),
        TypeOfData.CapacityOfGlass.rawValue : ("Capasity of glass","")
    ]
    
    func updateValues()
    {
        data[TypeOfData.DailyGoal.rawValue]!.1 = "\(model.getData(typeOfData: .DailyGoal))"
        data[TypeOfData.WakeUpTime.rawValue]!.1 = "\(model.getData(typeOfData: .WakeUpTime))"
        data[TypeOfData.CapacityOfCup.rawValue]!.1 = "\(model.getData(typeOfData: .CapacityOfCup))"
        data[TypeOfData.CapacityOfGlass.rawValue]!.1 = "\(model.getData(typeOfData: .CapacityOfGlass))"
    }
}
