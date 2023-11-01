//
//  Item.swift
//  skipTracker
//
//  Created by Anson Goo, Daniel Lee on 10/13/23.
//

import Foundation
import SwiftData

@Model
final class ClassItem {
    var className: String
    var startTime: Date
    var endTime: Date
    
    var mon: Bool
    var tues: Bool
    var wed: Bool
    var thurs: Bool
    var fri: Bool
    
    var location: String //store the name of the location
    
    //format start & end times for display purposes in list (easy retrieval & less issues)
    var formattedStartTime: String{
        let df = DateFormatter()
        df.timeStyle = .short
        return df.string(from: startTime)
    }
    
    var formattedEndTime: String{
        let df = DateFormatter()
        df.timeStyle = .short
        return df.string(from: endTime)
    }
    
    
    
    init(className: String = "",
         startTime: Date = .now,
         endTime: Date = .now,
         mon: Bool = false,
         tues: Bool = false,
         wed: Bool = false,
         thurs: Bool = false,
         fri: Bool = false,
         location: String = ""
    ) {
        
        self.className = className
        self.startTime = startTime
        self.endTime = endTime
        self.mon = mon
        self.tues = tues
        self.wed = wed
        self.thurs = thurs
        self.fri = fri
        self.location = location
    }
}
