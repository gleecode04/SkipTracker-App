//
//  Track.swift
//  skipTracker
//
//  Created by Anson Goo, Daniel Lee on 10/14/23.
//

import Foundation
import SwiftData

@Model
final class Track: Identifiable {
    
    
    var skipped: Bool
    var date: Date
    var className: String //this is going to be retrieved from the other database
    
    init(skipped: Bool = false, date: Date = .now, className: String = "") {
        self.skipped = skipped
        self.date = date
        self.className = className
    }
    
    static var sampleData: [Track] {
            [
                Track(skipped: true, className: "Math"),
                Track(skipped: false, className: "English"),
//                Track(skipped: true, date: date(year: Int, month: <#T##Int#>, day: <#T##Int#>) , className: "Linear")
            ]
    }

}










