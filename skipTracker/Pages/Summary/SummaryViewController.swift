//
//  SummaryViewController.swift
//  skipTracker
//
//  Created by Jessie Xu on 10/14/23.
//

import Foundation
import UIKit

class SummaryViewController: UIViewController {
    
    
    
    func greet() {
            print ("hello world")
        }

        // Button action function
        @objc func buttonAction(sender: UIButton!) {
            print("Button tapped")
        }
    
    
    //inputArray:Array<Track> || inputArray:Array<T>
//    static func getSkipped(_ array: [Track]) -> Array<Date> {
//        var convertedArray: [Date] = []
//        
//        
//
//        for dat in Track.sampleData {
//            if (CFCalendarGetFirstWeekday(Calendar:iso).compare(dat.date) == .orderedAscending && dat.date.compare(.now) == .orderedAscending && dat.skipped) {
//                convertedArray.append(dat.date)
//            }
//        }
//        return convertedArray
//    }
//    
//    func filterWeekdays(from dates: [Date]) -> [Date] {
//        let calendar = Calendar.current
//        let currentDate = Date()
//
//        // Get the current weekday and calculate the difference between the current day and Monday
//        let currentWeekday = calendar.component(.weekday, from: currentDate)
//        let daysUntilMonday = (currentWeekday + 5) % 7
//
//        // Calculate the start of the current week (considering Monday as the first day)
//        guard let startOfWeek = calendar.date(byAdding: .day, value: -daysUntilMonday, to: currentDate) else {
//            return []
//        }
//
//        // Calculate the end of the current week (considering Friday as the last day)
//        guard let endOfWeek = calendar.date(byAdding: .day, value: 4, to: startOfWeek) else {
//            return []
//        }
//
//        // Filter the dates within the current week
//        let filteredDates = dates.filter { date in
//            return calendar.isDate(date, inDatesBetween: startOfWeek, and: endOfWeek)
//        }
//
//        return filteredDates
//    }
//
//    // Example usage:
//    let allDates = [/* your array of Date objects */]
//    let weekdaysInCurrentWeek = filterWeekdays(from: allDates)
//    print(weekdaysInCurrentWeek)

}
