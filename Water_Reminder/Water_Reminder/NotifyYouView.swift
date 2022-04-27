//
//  SwiftUIView.swift
//  Water_Reminder
//
//  Created by Daniil on 12.04.2022.
//

import SwiftUI

struct NotifyYouView: View
{
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                VStack()
                {
                    ForEach(0..<2)
                    { i in
                        Spacer()
                            .frame(width: 10)
                    }
                    
                    Text("I will\nnotify you.")
                        .fontWeight(.bold)
                        .baselineOffset(10)
                        .font(.system(size: 40, weight: .heavy, design: .rounded))
                    
                    Spacer()
                        .frame(width: 10)
                    
                    NavigationLink(
                        destination: {HowMuchWaterView()},
                        label: {
                            Circle()
                                .fill(.blue)
                                .frame(width: 80, height: 80)
                                .shadow(radius: 10)
                                .overlay(
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(.white)
                                        .font(.largeTitle))
                        }
                    )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: 15, y: 0)
                }
            }
        }.navigationBarHidden(true)
            .preferredColorScheme(.light)
    }
}
struct NotifyYouView_Previews: PreviewProvider {
    static var previews: some View {
        NotifyYouView()
        
    }
}
