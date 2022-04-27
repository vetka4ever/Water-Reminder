//
//  SettingDailyGoalPresenter.swift
//  Water_Reminder
//
//  Created by Daniil on 17.04.2022.
//

import Foundation
class SettingDailyGoalPresenter: ObservableObject
{
    private var model = LocalStorage()
    @Published var currentDailyGoal = 0
    @Published var dailyGoalsValues = [(Int, String)]()
    
    init()
    {
        currentDailyGoal = model.getData(typeOfData: .DailyGoal) as! Int
        dailyGoalsValues = model.getCountDailyWater()
    }
    
    func saveNewDate()
    {
        model.saveData(data: currentDailyGoal, typeOfdata: .DailyGoal)
    }
}
