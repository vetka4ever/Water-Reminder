//
//  MainView.swift
//  Water_Reminder
//
//  Created by Daniil on 13.04.2022.
//

import SwiftUI

struct MainView: View
{
    @ObservedObject private var presenter = MainPresenter()
    
    var body: some View
    {
        NavigationView
        {
            
                
                VStack()
                {
                    Spacer()
                    
                    Text(presenter.stringPercent)
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    
                    Text((presenter.stringRatio))
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                    HStack
                    {
                        Button {presenter.changeCurrentDailyGoal(typeOfCapacity: .glass)}
                    label: {
                        Circle()
                            .padding()
                            .frame(width: 100, height: 100)
                            .shadow(radius: 10)
                            .foregroundColor(.blue)
                            .overlay(
                                Image("glass")
                                    .foregroundColor(.black)
                                    .font(.largeTitle)
                            )
                    }
                        
                        Spacer()
                        
                        Button {
                            presenter.changeCurrentDailyGoal(typeOfCapacity: .cup)
                            
                        } label: {
                            Circle()
                                .padding()
                                .frame(width: 100, height: 100)
                                .shadow(radius: 10)
                                .foregroundColor(.blue)
                                .overlay(
                                    Image("cup")
                                        .foregroundColor(.black)
                                        .font(.caption2)
                                )
                        }
                    }
                    
                    
                }
                .onAppear
                {
                    UIApplication.shared.applicationIconBadgeNumber = 0
                    presenter.updateValues()
                }
                .navigationBarItems(
                    trailing: NavigationLink(
                        destination: {SettingView()},
                        label: {
                            Image(systemName: "gearshape")
                                .foregroundColor(Color.gray)
                                .font(.callout)
                        }))
                .navigationBarTitle("", displayMode: .inline)
            
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.light)
    }
}

struct MainView_Previews: PreviewProvider
{
    static var previews: some View{
        MainView()
        
        
    }
}
