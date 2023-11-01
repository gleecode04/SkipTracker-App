//
//  Schedules.swift
//  skipTracker
//
//  Created by Anson Goo on 10/14/23.
//

import Foundation
import SwiftUI
import SwiftData

struct Schedules: View{
    
    @Environment(\.modelContext) private var context
    @Query private var items: [ClassItem]
    @State private var showAdd = false
    var tempItems = ["Linear Algebra", "Science Foundation of Health", "Discrete Math", "Multivariable Calculus", "Data Structures", "Intro to Comp Sci"]
    
    var body: some View{
        NavigationStack{
            ZStack{
                VStack{
                    List(tempItems, id:\.self){ item in
                        if(item == "Linear Algebra"){
                            Text(item + "\n12:30 am - 12:31 am" + "\n10/13/23")
                                .swipeActions{
                                    Button(role: .destructive){
                                        withAnimation{
                                            print("")
                                        }
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                            .symbolVariant(.fill)
                                    }
                                }
                        }else if(item == "Science Foundation of Health"){
                            Text(item + "\n12:35 am - 12:36 am" + "\nCollege of Computing")
                        }else if(item == "Discrete Math"){
                            Text(item + "\n12:35 am - 12:36 am" + "\nKlaus Advanced Computing Building")
                        }else if(item == "Multivariable Calculus"){
                            Text(item + "\n4:50 pm - 4:51 pm" + "\nMason Building")
                        }else if(item == "Data Structures"){
                            Text(item + "\n12:03 am - 12:04 am" + "\nCollege of Computing")
                        }else if(item == "Intro to Comp Sci"){
                            Text(item + "\n4:30 pm - 5:20 pm" + "\nCollege of Computing")
                        }
//                        ForEach(items) { item in
//                            HStack{
//                                Text(item.className + "\n" + item.location)
//                            }
//                            .swipeActions{
//                                Button(role: .destructive){
//                                    withAnimation{
//                                        context.delete(item)
//                                    }
//                                } label: {
//                                    Label("Delete", systemImage: "trash")
//                                        .symbolVariant(.fill)
//                                }
//                            }
//
//                        }
                        
                        
                    }
                    .frame(maxHeight: 435)
                    .padding(.top)
                    
//
//                    List{
//                        ForEach(items) { item in
//                            HStack{
//                                Text(item.className + "\n" + item.location)
//                            }
//                            .swipeActions{
//                                Button(role: .destructive){
//                                    withAnimation{
//                                        context.delete(item)
//                                    }
//                                } label: {
//                                    Label("Delete", systemImage: "trash")
//                                        .symbolVariant(.fill)
//                                }
//                            }
//                            
//                        }
//                    }
//                    .padding(.top)
//                    List(items, id:\.self){ item in
//                        Text(item + "\n Klaus 3:30 pm - 4:20 pm")
//                    }
//                    .padding(.top)
                    
                    Button{
                        showAdd.toggle()
                    } label:{
                        Text("+ Add Class")
                            .font(.headline)
                            .padding(.vertical, 5)
                            .frame(maxWidth: 200)
                    }
                    .buttonStyle(.bordered)
                    .padding(.bottom, 30)
                    
                    Spacer()
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                            EditButton()
//                        }
//                }
                
            }
                .sheet(isPresented: $showAdd,
                       content: {
                           NavigationStack{
                               AddScheduleView()
                           }
                           .presentationDetents([.medium])
                       })
                }
                .navigationTitle("My Classes")
        }
        
    }
}

#Preview {
    Schedules()
//        .modelContainer(for: ClassItem.self, inMemory: true)
}
