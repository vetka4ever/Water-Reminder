//
//  AskPresenter.swift
//  Water_Reminder
//
//  Created by Daniil on 12.04.2022.
//

import Foundation
import SwiftUI
class LocalStorage: ObservableObject
{
    
    enum TypeOfdata: String
    {
        case DailyGoal
        case CurrentDailyGoal
        case DateOfGoal
        case CurrentDate
        case WakeUpTime
        case RemindValue
        case CapacityOfCup
        case CapacityOfGlass
        case FirstSettingIsComplite
    }
    
    func getCountDailyWater() -> [(Int, String)]
    {
        var num = 2000
        var arr = [(Int, String)]()
        while (num <= 4000)
        {
            arr.append((num,"ml"))
            num += 250
        }
        return arr
    }
    
    func getRemainderHours() -> [(Int, String)]
    {
        var num = 2
        var arr = [(1, "hour")]
        while (num <= 6)
        {
            arr.append((num,"hours"))
            num += 1
        }
        return arr
    }
    
    
    func saveData(data: Any, typeOfdata: TypeOfdata)
    {
        switch typeOfdata {
        case .DailyGoal:
            UserDefaults.standard.set(data as! Int, forKey: typeOfdata.rawValue)
        case .WakeUpTime:
            UserDefaults.standard.set(data as! String, forKey: typeOfdata.rawValue)
        case .RemindValue:
            UserDefaults.standard.set(data as! Int, forKey: typeOfdata.rawValue)
        case .FirstSettingIsComplite:
            UserDefaults.standard.set(data as! Bool, forKey: typeOfdata.rawValue)
        case .CapacityOfCup:
            let value = data as! Int
            UserDefaults.standard.set((value != 0 ? (value) : (200)), forKey: typeOfdata.rawValue)
        case .CapacityOfGlass:
            let value = data as! Int
            UserDefaults.standard.set((value != 0 ? (value) : (250)), forKey: typeOfdata.rawValue)
        case .CurrentDailyGoal:
            UserDefaults.standard.set(data as! Int, forKey: typeOfdata.rawValue)
        case .CurrentDate:
            UserDefaults.standard.set(data as! String, forKey: typeOfdata.rawValue)
        case .DateOfGoal:
            UserDefaults.standard.set(data as! String, forKey: typeOfdata.rawValue)
        }
    }
    func getData(typeOfData: TypeOfdata) -> Any
    {
        
        switch typeOfData {
        case .DailyGoal:
            return UserDefaults.standard.integer(forKey: typeOfData.rawValue)
        case .WakeUpTime:
            return UserDefaults.standard.string(forKey: typeOfData.rawValue)!
        case .RemindValue:
            return UserDefaults.standard.integer(forKey: typeOfData.rawValue)
        case .CapacityOfCup:
            return UserDefaults.standard.integer(forKey: typeOfData.rawValue)
        case .CapacityOfGlass:
            return UserDefaults.standard.integer(forKey: typeOfData.rawValue)
        case .FirstSettingIsComplite:
            return UserDefaults.standard.bool(forKey: typeOfData.rawValue)
        case .CurrentDailyGoal:
            return UserDefaults.standard.integer(forKey: typeOfData.rawValue)
        case .CurrentDate:
            return UserDefaults.standard.string(forKey: typeOfData.rawValue)!
        case .DateOfGoal:
            return UserDefaults.standard.string(forKey: typeOfData.rawValue)!
        }
        
    }
}
