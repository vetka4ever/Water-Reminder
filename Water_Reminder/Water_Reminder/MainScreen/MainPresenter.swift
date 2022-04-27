//
//  MainPresenter.swift
//  Water_Reminder
//
//  Created by Daniil on 20.04.2022.
//

import Foundation
class MainPresenter: ObservableObject
{
    private let model = LocalStorage()
    private var capacityOfCup = 0
    private var capacityOfGlass = 0
    private var currentDailyGoal = 0
    private var dailyGoal = 0
    
    enum TypeOfCapacity
    {
        case cup
        case glass
    }
    
    @Published var stringPercent = ""
    @Published var stringRatio = ""
    @Published var ratio: Double = 0
    
    
    func changeCurrentDailyGoal(typeOfCapacity: TypeOfCapacity)
    {
        
        switch typeOfCapacity
        {
        case .cup:
            currentDailyGoal += capacityOfCup
        case .glass:
            currentDailyGoal += capacityOfGlass
        }
        model.saveData(data: currentDailyGoal, typeOfdata: .CurrentDailyGoal)
        updateLines()
       
    }
    
    private func updateLines()
    {
        stringPercent = "\(currentDailyGoal * 100 / dailyGoal) %"
        ratio = Double(currentDailyGoal) / Double(dailyGoal)
        stringRatio = "\(currentDailyGoal) / \(dailyGoal)"
    }
    func updateValues()
    {
        
        checkDate()
        
        currentDailyGoal = model.getData(typeOfData: .CurrentDailyGoal) as! Int
        dailyGoal = model.getData(typeOfData: .DailyGoal) as! Int
       
        updateLines()
        
        capacityOfCup = model.getData(typeOfData: .CapacityOfCup) as! Int
        capacityOfGlass = model.getData(typeOfData: .CapacityOfGlass) as! Int
    }
    
    func checkDate()
    {
        let previouslyDateOfGoal = model.getData(typeOfData: .DateOfGoal) as! String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        let newDateOfGoal = dateFormatter.string(from: Date())
        
        if newDateOfGoal != previouslyDateOfGoal
        {
            model.saveData(data: newDateOfGoal, typeOfdata: .DateOfGoal)
            model.saveData(data: 0, typeOfdata: .CurrentDailyGoal)
        }
    }
}
