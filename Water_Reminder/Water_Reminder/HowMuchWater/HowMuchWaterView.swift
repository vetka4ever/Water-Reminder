//
//  AskView.swift
//  Water_Reminder
//
//  Created by Daniil on 12.04.2022.
//

import SwiftUI

struct HowMuchWaterView: View {
    private var presenter = HowMuchWaterPresenter()
    private var countOfDailyDrink = [(Int,String)]()
    init()
    {
        countOfDailyDrink = presenter.getCountDailyWater()
        
    }
    var body: some View {
        NavigationView
        {
            VStack{
                Text("How much water do you want daily to drink?")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading)
                    {
                        ForEach(countOfDailyDrink.indices)
                        {i in
                            NavigationLink() {WakeUpTimeView()}
                        label:
                            {
                                Text("\(countOfDailyDrink[i].0)" + " " + countOfDailyDrink[i].1)
                                    .underline()
                                    .foregroundColor(.gray)
                                    .font(.system(.callout, design: .rounded))
                                    .padding()
                                    .padding(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .simultaneousGesture(TapGesture().onEnded{presenter.saveDailyGoal(goal: countOfDailyDrink[i].0)})
                            Divider()
                        }
                    }
                }
                
            }
        }.navigationBarHidden(true)
            .preferredColorScheme(.light)
    }
}

struct HowMuchWaterView_Previews: PreviewProvider {
    static var previews: some View {
        HowMuchWaterView()
        
    }
}
