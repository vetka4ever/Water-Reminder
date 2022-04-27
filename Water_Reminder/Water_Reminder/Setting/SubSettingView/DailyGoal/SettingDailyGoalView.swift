//
//  SettingDailyGoalView.swift
//  Water_Reminder
//
//  Created by Daniil on 16.04.2022.
//

import SwiftUI

struct SettingDailyGoalView: View
{
    @Environment(\.presentationMode) var presentMode: Binding<PresentationMode>
    @EnvironmentObject private var lastPresenter: SettingPresenter
    @ObservedObject private var presenter = SettingDailyGoalPresenter()
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Text("How much water do you want daily to drink?")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false)
                {
                    
                    VStack(alignment: .leading)
                    {
                        ForEach(presenter.dailyGoalsValues.indices)
                        {i in
                            Button()
                            {
                                presenter.currentDailyGoal = presenter.dailyGoalsValues[i].0
                                presenter.saveNewDate()
                                lastPresenter.updateValues()
                                presentMode.wrappedValue.dismiss()
                            }
                        label:
                            {
                                Text("\(presenter.dailyGoalsValues[i].0) \(presenter.dailyGoalsValues[i].1)")
                                    .underline()
                                    .foregroundColor(.gray)
                                    .font(.system(.callout, design: .rounded))
                                    .padding()
                                    .padding(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }

                            Divider()
                        }
                    }
                }
                .navigationBarItems(
                    leading: Button(action: {self.presentMode.wrappedValue.dismiss()},
                                    label: {Image(systemName: "xmark")}))
            }
            .navigationBarTitle("", displayMode: .inline)
            //                .navigationBarHidden(true)
            
        }.navigationBarHidden(true)
        
            .preferredColorScheme(.light)
    }
    
    
}


struct SettingDailyGoalView_Previews: PreviewProvider {
    static var previews: some View {
        SettingDailyGoalView()
    }
}
