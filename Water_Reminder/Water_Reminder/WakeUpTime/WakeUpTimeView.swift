//
//  WakeUpTime.swift
//  Water_Reminder
//
//  Created by Daniil on 12.04.2022.
//

import SwiftUI

struct WakeUpTimeView: View {
    
    @State var selectedDate: Date =
    {
        let calendar = DateFormatter()
        calendar.dateFormat = "HH:mm"
        if let date = calendar.date(from:"06:00")
        {
            return date
        }
        else
        {
            return calendar.date(from:"06:00 AM")!
        }
        
    }()
    
    private var saveToLocalMemory = LocalStorage()
    @StateObject private var presenter = WakeUpTimePresenter()
    var body: some View
    {
        NavigationView
        {
            VStack(alignment: .leading)
            {
                VStack
                {
                    Text("Wake up time")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    DatePicker("Wake up time", selection: $selectedDate, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                        .clipped()
                        .datePickerStyle(.compact)
                        .labelsHidden()
                }
                
                Spacer()
                    .frame(width: 10)
                
                NavigationLink {RemaindMeView()}
            label: {
                Circle()
                    .fill(.blue)
                    .frame(width: 80, height: 80)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    )
            }
            .simultaneousGesture(TapGesture().onEnded{presenter.saveWakeUpTime(date: selectedDate)})
            }
        }.navigationBarHidden(true)
            .preferredColorScheme(.light)
    }
}

struct WakeUpTimeView_Previews: PreviewProvider {
    static var previews: some View {
        WakeUpTimeView()
        
    }
}
