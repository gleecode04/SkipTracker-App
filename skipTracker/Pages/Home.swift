//
//  ContentView.swift
//  skipTracker
//
//  Created by Anson Goo, Daniel Lee on 10/13/23.
//

import SwiftUI
import UIKit
import SwiftData
import MapKit

struct Home: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [ClassItem]
//    var items = ["Science Foundation of Health", "Discrete Math", "Data Structures", "Linear Algebra", "Multivariable Calculus"]
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    //displays the skip data
                    VStack{
                        Text("5")
                            .font(.system(size: 48, weight: .medium, design: .default))
                            .padding(.top, 35)
                            
                        Text("Skipped")
                            .font(.system(size: 25, weight: .light, design: .default))
                    }
                    List{
                        Section("History"){
                            ForEach(items, id:\.self){ item in
                                
                                
                                
                                //hard coded values
//                                if(item == "Linear Algebra"){
//                                    Text(item + "\n12:30 am - 12:31 am" + "\n10/14/23")
//                                }else if(item == "Science Foundation of Health"){
//                                    Text(item + "\n12:35 am - 12:36 am" + "\n10/13/23")
//                                }else if(item == "Discrete Math"){
//                                    Text(item + "\n12:35 am - 12:36 am" + "\n10/13/23")
//                                }else if(item == "Multivariable Calculus"){
//                                    Text(item + "\n4:50 pm - 4:51 pm" + "\n10/15/23")
//                                }else if(item == "Data Structures"){
//                                    Text(item + "\n12:03 am - 12:04 am" + "\n10/13/23")
//                                }
                                
                            }
                            .padding(.top, 4)
                            .padding(.bottom, 4)
                        }
                    }
                    .padding(.bottom, 20)
                    
                    
                   Spacer()
                }
            }
            .navigationTitle("Skip Tracker")
            
        }
        .onAppear{
            let viewModel = ContentViewModel()
            viewModel.checkIfLocationServiceIsEnabled()
        }
    }
}


#Preview {
    Home()
        .modelContainer(for: ClassItem.self, inMemory: true)
}
