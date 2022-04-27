//
//  SettingView.swift
//  Water_Reminder
//
//  Created by Daniil on 13.04.2022.
//

import SwiftUI
struct SettingView: View {
    @ObservedObject private var presenter = SettingPresenter()
    @State private var showSubView = false
    @State private var arrayOfBindingBool = [false, false, false, false, false]

    var body: some View {
        NavigationView
        {
            ScrollView(showsIndicators: false)
            {
                VStack
                {
                    ForEach(0..<presenter.data.count) { i in
                        HStack
                        {
                            Button {
                                arrayOfBindingBool[i].toggle()
                            } label: {
                                Text("\(presenter.data[i]!.0)")
                                    .font(.system( .callout, design: .rounded))
                                    .foregroundColor(.black)
                                    .padding()
                                Spacer()
                                Text("\(presenter.data[i]!.1)")
                                    .foregroundColor(.blue)
                                    .padding(.trailing)
                            }
                            .fullScreenCover(isPresented: $arrayOfBindingBool[SettingPresenter.TypeOfData.WakeUpTime.rawValue]) {
                                SettingTimeView().environmentObject(presenter)
                            }
                            
                            .fullScreenCover(isPresented: $arrayOfBindingBool[SettingPresenter.TypeOfData.DailyGoal.rawValue]) {
                                SettingDailyGoalView().environmentObject(presenter)
                            }
                            
                            .fullScreenCover(isPresented: $arrayOfBindingBool[SettingPresenter.TypeOfData.CapacityOfCup.rawValue]) {
                                SettingCupView().environmentObject(presenter)
                            }
                            
                            .fullScreenCover(isPresented: $arrayOfBindingBool[SettingPresenter.TypeOfData.CapacityOfGlass.rawValue]) {
                                SettingGlassView().environmentObject(presenter)
                            }
                            
                            .fullScreenCover(isPresented: $arrayOfBindingBool[SettingPresenter.TypeOfData.Notification.rawValue]) {
                                SettingNotificationView()
                            }
                        
                    }
                    Divider()
                    }
                    
            }
            }.padding()
            .navigationBarHidden(true)
            .onAppear()
            {
                presenter.updateValues()
            }
    }.preferredColorScheme(.light)
        .navigationBarTitle("Setting", displayMode: .large)
        

}

}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
