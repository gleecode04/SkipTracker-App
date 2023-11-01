//
//  AddSchedule.swift
//  skipTracker
//
//  Created by Anson Goo, Daniel Lee on 10/14/23.
//

import Foundation
import SwiftUI

struct AddScheduleView: View{
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var item = ClassItem()
    
    var buildingNames = [
        "Allen Sustainable",
        "Boggs Building",
        "Bunger Henry Building",
        "Cherry Emerson Building",
        "Clough Commons",
        "College of Computing",
        "College of Design East",
        "College of Design West",
        "Engineering Science & Mechanics Building",
        "Ford Environmental Science & Technology Building",
        "Guggenheim Aerospace Building",
        "Howey Physics",
        "Instructional Center",
        "Kendeda Building for Innovative Sustainable Design",
        "Klaus Advanced Computing Building",
        "Love Manufacturing Building",
        "Manufacturing Related Disciplines Complex",
        "Mason Building",
        "Molecular Sciences Engineering Building",
        "Paper Tricentennial Building Renewable Bioproducts Institute",
        "Scheller College of Business",
        "Skiles Classroom Building",
        "Smith Building",
        "Swann Building",
        "Van Leer Building",
        "Weber Space Science & Technology Building III",
        "Whitaker Building"
    ]
    
    var body: some View{
        NavigationStack{
        List{
            TextField("Class Name", text: $item.className)
                .padding(.all, 8)
            
            Picker("Location", selection: $item.location){
                ForEach(buildingNames, id:\.self){
                    Text($0)
                }
            }
            .pickerStyle(.navigationLink)
            
            HStack{
                SelectButton(
                    isSelected: $item.mon,
                    color: .blue,
                    text: "M")
                .onTapGesture {
                    item.mon.toggle()
                }
                
                SelectButton(
                    isSelected: $item.tues,
                    color: .blue,
                    text: "T")
                .onTapGesture {
                    item.tues.toggle()
                }
                
                SelectButton(
                    isSelected: $item.wed,
                    color: .blue,
                    text: "W")
                .onTapGesture {
                    item.wed.toggle()
                }
                
                SelectButton(
                    isSelected: $item.thurs,
                    color: .blue,
                    text: "T")
                .onTapGesture {
                    item.thurs.toggle()
                }
                
                SelectButton(
                    isSelected: $item.fri,
                    color: .blue,
                    text: "F")
                .onTapGesture {
                    item.fri.toggle()
                }
            }
                .padding(.all, 8)
            
            DatePicker("Start Time", selection: $item.startTime, displayedComponents: .hourAndMinute)
                .padding(.all, 6)
            
            DatePicker("End Time", selection: $item.endTime, displayedComponents: .hourAndMinute)
                .padding(.all, 6)
        }
        .navigationTitle("Add New Class")
        
        Button{
            withAnimation{
                context.insert(item)
            }
            dismiss()
        } label:{
            Text("Add")
                .font(.headline)
                .padding(.vertical, 5)
                .frame(maxWidth: 200)
        }
        .padding(.horizontal, 50)
        .buttonStyle(.bordered)
        }
    }
}

#Preview {
    AddScheduleView()
        .modelContainer(for: ClassItem.self, inMemory: true)
}
