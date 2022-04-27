//
//  WakeUpTimePresenter.swift
//  Water_Reminder
//
//  Created by Daniil on 25.04.2022.
//

import Foundation
import SwiftUI
class WakeUpTimePresenter: ObservableObject
{
    private var model = LocalStorage()
    
    func saveWakeUpTime(date: Date)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let line = formatter.string(from: date)
        model.saveData(data: line, typeOfdata: .WakeUpTime)
    }
    
}
