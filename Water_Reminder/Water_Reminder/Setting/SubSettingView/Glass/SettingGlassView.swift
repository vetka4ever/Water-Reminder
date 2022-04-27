//
//  SettingGlassView.swift
//  Water_Reminder
//
//  Created by Daniil on 16.04.2022.
//

import SwiftUI

struct SettingGlassView: View
{
    @Environment(\.presentationMode) var presentMode: Binding<PresentationMode>
    @EnvironmentObject private var lastPresenter: SettingPresenter
    @ObservedObject private var presenter = SettingGlassPresenter()
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Text("Capacity of glass")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false)
                {
                    VStack(alignment: .leading)
                    {
                        ForEach(presenter.glassValues.indices)
                        {i in
                            Button()
                            {
                                presenter.currentGlass = presenter.glassValues[i].0
                                presenter.saveNewDate()
                                lastPresenter.updateValues()
                                presentMode.wrappedValue.dismiss()
                                }
                        label:
                            {
                                Text("\(presenter.glassValues[i].0) \(presenter.glassValues[i].1)")
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

struct SettingGlassView_Previews: PreviewProvider {
    static var previews: some View {
        SettingGlassView()
    }
}
