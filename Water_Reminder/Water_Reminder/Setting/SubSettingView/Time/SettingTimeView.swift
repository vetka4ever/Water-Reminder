//
//  SettingTimeVIew.swift
//  Water_Reminder
//
//  Created by Daniil on 14.04.2022.
//

import SwiftUI

struct SettingTimeView: View
{
    @Environment(\.presentationMode) var presentMode: Binding<PresentationMode>
    @EnvironmentObject private var lastPresenter: SettingPresenter
    @ObservedObject private var presenter = SettingTimePresenter()
    
    
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
                    
                    DatePicker("", selection: $presenter.currentDate, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                        .clipped()
                        .labelsHidden()
                }
                Spacer()
                    .frame(width: 10)
            
                Button
                {
                    presenter.saveNewDate()
                    lastPresenter.updateValues()
                    self.presentMode.wrappedValue.dismiss()
                }
            label:
                {
                    Circle()
                        .fill(.blue)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 10)
                        .overlay(
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .font(.system(.title, design: .rounded))
                                .font(.largeTitle)
                        )
                }
                .navigationBarItems(
                    leading: Button(action: {self.presentMode.wrappedValue.dismiss()},
                                    label: {Image(systemName: "xmark")}))
            }
            .navigationBarTitle("", displayMode: .inline)
        }.preferredColorScheme(.light)
        
        
    }
}

struct SettingTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SettingTimeView()
    }
}
