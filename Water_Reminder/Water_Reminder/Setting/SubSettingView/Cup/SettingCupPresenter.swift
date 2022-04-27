//
//  SettingCupPresenter.swift
//  Water_Reminder
//
//  Created by Daniil on 17.04.2022.
//

import Foundation
class SettingCupPresenter: ObservableObject
{
    private var model = LocalStorage()
    @Published var currentCup = 0
    @Published var cupValues = [(Int, String)]()
    
    init()
    {
        currentCup = model.getData(typeOfData: .CapacityOfCup) as! Int
        
        var cupValue = 50
        while cupValue <= 500
        {
            cupValues.append((cupValue,"ml"))
            cupValue += 50
        }
    }
    
    func saveNewDate()
    {
        model.saveData(data: currentCup, typeOfdata: .CapacityOfCup)
    }
}
