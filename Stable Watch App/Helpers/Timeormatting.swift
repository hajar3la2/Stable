//
//  Timeormatting.swift
//  Stable Watch App
//
//  Created by Hajar on 1/10/23.
//

import Foundation

func getDateToday() -> String{
//        let date = Date()
//        var calendar = Calendar.current
//        _ = calendar.component(.day, from: date)
//        var dateFormatter = DateFormatter()
//        return String(dateFormatter.string(from: calendar))
    let today = Date.now
    let formatter1 = DateFormatter()
    formatter1.dateStyle = .short
    formatter1.dateFormat = "E, d MMM"
    return formatter1.string(from: today)
}


func getDate(theDate:Date) -> String{
    let formatter1 = DateFormatter()
    formatter1.dateStyle = .short
    formatter1.dateFormat = "E, d MMM"
    return formatter1.string(from: theDate)
}
