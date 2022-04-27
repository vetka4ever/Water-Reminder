//
//  HowMuchWaterPresenter.swift
//  Water_Reminder
//
//  Created by Daniil on 25.04.2022.
//

import Foundation
class HowMuchWaterPresenter
{
    private var model = LocalStorage()
    
    func getCountDailyWater() -> [(Int, String)]
    {
        return model.getCountDailyWater()
    }
    
    func saveDailyGoal(goal: Int)
    {
        model.saveData(data: goal, typeOfdata: .DailyGoal)
    }
}
