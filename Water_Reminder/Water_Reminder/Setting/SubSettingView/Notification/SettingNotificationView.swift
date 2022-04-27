//
//  SettingNotificationView.swift
//  Water_Reminder
//
//  Created by Daniil on 16.04.2022.
//

import SwiftUI

struct SettingNotificationView: View {
    @Environment(\.presentationMode) var presentMode: Binding<PresentationMode>
    @ObservedObject private var presenter = SettingNotificationPresenter()
    private var hours = [(Int,String)]()
    
    init()
    {
        hours = presenter.getRemainderHours()
    }
    var body: some View
    {
        NavigationView
        {
            
            VStack
            {
                Text("Remind me every")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.semibold)
                
                ScrollView
                {
                    VStack
                    {
                        ForEach(hours.indices) { i in
                            Button
                            {
                                presenter.saveRemaindValue(remaindValue: hours[i].0)
                                self.presentMode.wrappedValue.dismiss()
                            }
                        label: {
                            Text("\(hours[i].0) \(hours[i].1)")
                                .underline()
                                .foregroundColor(.gray)
                                .font(.system(.callout, design: .rounded))
                                .padding()
                                .padding(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                            
                        }
                    }
                }
            }
            .navigationBarItems(leading: Button(action: {self.presentMode.wrappedValue.dismiss()},
                                                label: {Image(systemName: "xmark")}))
            .navigationBarTitle("", displayMode: .inline)
        }.navigationBarHidden(true)
    }
}


struct SettingNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        SettingNotificationView()
    }
}
