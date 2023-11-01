//
//  Schedules.swift
//  skipTracker
//
//  Created by Anson Goo, Daniel Lee on 10/14/23.
//

import Foundation
import SwiftUI
import SwiftData

struct Schedules: View{
    
    @Environment(\.modelContext) private var context
    @Query private var items: [ClassItem]
    @State private var showAdd = false
    
    
    var body: some View{
        NavigationStack{
            ZStack{
                VStack{
                    //displays class information in a list
                    //hypothetically it should work (will deal with formatting later)
                    ForEach(items) { item in
                        HStack{
                            Text(item.className + "\n" + item.location)
                            Text((item.formattedStartTime) + " - " + (item.formattedEndTime))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .swipeActions{
                            Button(role: .destructive){
                                withAnimation{
                                    context.delete(item)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                                    .symbolVariant(.fill)
                            }
                        }

                    }
                        
                
                
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
//                .frame(maxHeight: 435)
                .padding(.top)
                
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


#Preview {
    Schedules()
        .modelContainer(for: ClassItem.self, inMemory: true)
}
