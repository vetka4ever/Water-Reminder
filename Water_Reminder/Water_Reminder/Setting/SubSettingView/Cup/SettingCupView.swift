//
//  SettingCupView.swift
//  Water_Reminder
//
//  Created by Daniil on 16.04.2022.
//

import SwiftUI

struct SettingCupView: View
{
    @Environment(\.presentationMode) var presentMode: Binding<PresentationMode>
    @EnvironmentObject private var lastPresenter: SettingPresenter
    @ObservedObject private var presenter = SettingCupPresenter()
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Text("Capacity of cup")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false)
                {
                    VStack(alignment: .leading)
                    {
                        ForEach(presenter.cupValues.indices)
                        {i in
                            Button()
                            {
                                presenter.currentCup = presenter.cupValues[i].0
                                presenter.saveNewDate()
                                lastPresenter.updateValues()
                                presentMode.wrappedValue.dismiss()
                            }
                        label:
                            {
                                Text("\(presenter.cupValues[i].0) \(presenter.cupValues[i].1)")
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
                
            }
            .navigationBarItems(
                leading: Button(action: {self.presentMode.wrappedValue.dismiss()},
                                label: {Image(systemName: "xmark")}))
            .navigationBarTitle("", displayMode: .inline)
            
        }.navigationBarHidden(true)
            .preferredColorScheme(.light)
    }
}


struct SettingCupView_Previews: PreviewProvider {
    static var previews: some View {
        SettingCupView()
    }
}
