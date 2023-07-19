//
//  Date + Extension.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 19.07.2023.
//

import Foundation


extension Date {

  var dayBefore: Date {
      return Calendar.current.date(byAdding: .day, value: -1, to: self)!
  }

  var day2Before: Date {
      return Calendar.current.date(byAdding: .day, value: -2, to: self)!
  }


  func get2DayBefore()->String {
    let date = Date().day2Before
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"

    return dateFormatter.string(from: date)
  }

  func getYesterday()->String {

    let date = Date().dayBefore
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let yesterday = dateFormatter.string(from: date)
    return yesterday

  }
}
