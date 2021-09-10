//
//  AnyFormatter.swift
//  
//
//  Created by Martina D'urso on 01/07/21.
//

import Foundation

extension String {
  
  func dateFormatter() -> Date? {
    let dateFormatter = ISO8601DateFormatter()
    dateFormatter.formatOptions = [.withYear,
                                   .withMonth,
                                   .withDay,
                                   .withFullTime,
                                   .withDashSeparatorInDate,
                                   .withColonSeparatorInTime,
                                   .withFractionalSeconds]
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)!
    return dateFormatter.date(from: self)
  }
  
  func dateFormatterWithoutFractionalSeconds() -> Date? {
    let dateFormatter = ISO8601DateFormatter()
    dateFormatter.formatOptions = [.withYear,
                                   .withMonth,
                                   .withDay,
                                   .withTime,
                                   .withDashSeparatorInDate,
                                   .withColonSeparatorInTime]
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)!
    return dateFormatter.date(from: self)
  }
  
}

extension Date {
  
  func dateFormatter(withFormat format: String = "dd.MM.yyyy -HH:mm") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)!
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }
  
  func isoDateFormatter(withTimeZone: Bool = false,
                        withFractionalSeconds: Bool = true) -> String {
    let dateFormatter = ISO8601DateFormatter()
    dateFormatter.formatOptions = [.withYear,
                                   .withMonth,
                                   .withDay,
                                   .withFullTime,
                                   .withDashSeparatorInDate,
                                   .withColonSeparatorInTime]
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)!
    if withTimeZone {
      dateFormatter.formatOptions.insert(.withTimeZone)
    }
    if withFractionalSeconds {
      dateFormatter.formatOptions.insert(.withFractionalSeconds)
    }
    return dateFormatter.string(from: self)
  }
  
  func timeFormatter() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)!
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.string(from: self)
  }
  
  func durationFormatter(endDate: Date, allowedUnits: NSCalendar.Unit = [.hour, .minute, .second]) -> String? {
    let dateInterval = DateInterval(start: self, end: endDate)
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = allowedUnits
    formatter.unitsStyle = .abbreviated
    return formatter.string(from: dateInterval.duration)
  }
  
}

extension Float {
  
  func kmFormatt() -> String? {
    return String(format: "%.3f", Float(self / 1000))
  }
  
  func msTimeFormatter() -> String? {
    let second = Int(self)/1000
    let hour = second/3600
    if let langStr = Locale.current.languageCode, langStr == "it" {
      return String(hour/24) + "g:" + String(hour%24) + "h"
    } else {
      return String(hour/24) + "d:" + String(hour%24) + "h"
    }
  }
}
