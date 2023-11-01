//
//  SummaryView.swift
//  skipTracker
//
//  Created by Anson Goo on 10/14/23.
//

import Foundation
import SwiftUI
import Charts
import SwiftData
import UIKit


struct ToyShape: Identifiable {
    var color: String
    var type: String
    var count: Double
    var id = UUID()
}



struct Summary: View{
    @Environment(\.modelContext) private var modelContext
  
    @Query(sort: \Track.date, order: .reverse)
        var arr: [Track]
    
    

    var body: some View{
        

//        let test = Track.sampleData.count //sample data
//        let croppedArray = SummaryViewController.getSkipped(Track.sampleData)
        
        let stackedBarData: [ToyShape] = [
//            .init(color: "Attended", type: "Mon", count: Double(croppedArray.count)),
            //mon
            .init(color: "Skipped", type: "Wed", count: 0),
            .init(color: "Attended", type: "Wed", count: 3),
            //tue
            .init(color: "Skipped", type: "Thur", count: 0),
            .init(color: "Attended", type: "Thur", count: 4),
            //wed
            .init(color: "Skipped", type: "Fri", count: 3),
            .init(color: "Attended", type: "Fri", count: 1),
            //thurs
            .init(color: "Skipped", type: "Sat", count: 1),
            .init(color: "Attended", type: "Sat", count: 1),
            //fri
            .init(color: "Skipped", type: "Sun", count: 1),
            .init(color: "Attended", type: "Sun", count: 1)
        ]
        
        NavigationStack{
            ZStack{ //allows you to put stuff on top (basically stacking)
                
                VStack (alignment: .leading){ // vertical container basically
//                    let _ = print("hi!")
                    
                    Chart {
                        ForEach(stackedBarData) { shape in
                            BarMark(
                                x: .value("Day", shape.type),
                                y: .value("# of Classes", shape.count)
                            )
                            .foregroundStyle(by: .value("Shape Color", shape.color))
                        }
                    }
                    .frame(maxHeight: 200)
                    .padding(.horizontal, 20)
                    .padding(.top, 25)
                    .padding(.bottom, 15)
                    
                    Section{
                        List{
                            Text("Avg. Atendance:                                37.5%")
                                .padding(.vertical,10)
                            Text("Most Missed:                      Equally Missed")
                                .padding(.vertical,10)
                            Text("Most Attended:                    Discrete Math")
                                .padding(.vertical,10)
                            (Text("Longest Streak:                                    2  ") + Text(Image(systemName: "flame")))
                                .padding(.vertical,10)
                            
                        }
                    }
                    
                }
            }
            .navigationTitle("Summary")
        }
    }
}

#Preview {
    Summary()
}
