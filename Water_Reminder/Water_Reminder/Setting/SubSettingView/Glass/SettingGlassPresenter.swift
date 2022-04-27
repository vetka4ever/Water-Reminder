//
//  SettingGlassPresenter.swift
//  Water_Reminder
//
//  Created by Daniil on 17.04.2022.
//

import Foundation
class SettingGlassPresenter: ObservableObject
{
    private var model = LocalStorage()
    @Published var currentGlass = 0
    @Published var glassValues = [(Int, String)]()
    
    init()
    {
        currentGlass = model.getData(typeOfData: .CapacityOfCup) as! Int
        
        var glassValue = 250
        while glassValue <= 500
        {
            glassValues.append((glassValue,"ml"))
            glassValue += 50
        }
    }
    
    func saveNewDate()
    {
        model.saveData(data: currentGlass, typeOfdata: .CapacityOfGlass)
    }
}
