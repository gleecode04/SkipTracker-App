//
//  MainView.swift
//  skipTracker
//
//  Created by Anson Goo on 10/14/23.
//

import Foundation
import SwiftUI

struct MainView: View{
    @State private var tabSelection = 2
    
    var body: some View{
        TabView(selection: $tabSelection){
            Schedules()
                .tabItem{
                    Image(systemName:"list.bullet")
                }
                .tag(1)
            Home()
                .tabItem {
                    Image(systemName:"circle.dashed")
                }
                .tag(2)
            Summary()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .resizable()
                        .scaledToFit()
                }
                .tag(3)
        }
    }
}

#Preview {
    MainView()
}
