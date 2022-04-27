//
//  RemainMeView.swift
//  Water_Reminder
//
//  Created by Daniil on 12.04.2022.
//

import SwiftUI

struct RemaindMeView: View {
    
    private var hours = [(Int,String)]()
    private var presenter = RemaindMePresenter()
    
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
                
                ScrollView(.vertical, showsIndicators: false)
                {
                    VStack
                    {
                        ForEach(hours.indices)
                        {
                            i in
                            
                            NavigationLink {MainView()}
                        label: {
                            Text("\(hours[i].0) \(hours[i].1)")
                                .underline()
                                .foregroundColor(.gray)
                                .font(.system(.callout, design: .rounded))
                                .padding()
                                .padding(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .simultaneousGesture(TapGesture().onEnded{presenter.saveRemaindValue(remaindValue: hours[i].0)})
                        }
                    }
                }
            }
        }.navigationBarHidden(true)
            .preferredColorScheme(.light)
    }
    
    
}

struct RemaindMeView_Previews: PreviewProvider {
    static var previews: some View {
        RemaindMeView()
        
    }
}
