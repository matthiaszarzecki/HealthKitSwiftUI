//
//  Date-Extension.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 04.05.21.
//

import Foundation

extension Date {
  static func mondayAt12AM() -> Date {
    return Calendar(identifier: .iso8601).date(
      from: Calendar(
        identifier: .iso8601
      ).dateComponents(
        [.yearForWeekOfYear, .weekOfYear],
        from: Date()
      )
    )!
  }
}
