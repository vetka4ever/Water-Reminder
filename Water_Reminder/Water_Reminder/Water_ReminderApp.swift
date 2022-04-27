//
//  Water_ReminderApp.swift
//  Water_Reminder
//
//  Created by Daniil on 11.04.2022.
//

import SwiftUI

@main
struct Water_ReminderApp: App {
    @StateObject var presenter = LocalStorage()
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: LocalStorage.TypeOfdata.FirstSettingIsComplite.rawValue) == false
            {
                TitleView().environmentObject(presenter)
            }
            else
            {
                MainView().environmentObject(presenter)
            }
                
        }
    }
}
