//
//  MockClasses.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 04.05.21.
//

import Foundation

struct MockClasses {
  static let stepAmount7000 = 7423
  static let dailyGoal = 7000
  static let stepLessThan10000Steps = Step(count: 4213, date: Date())
  static let stepMoreThan10000Steps = Step(count: 14213, date: Date())
  
  static let steps = [
    Step(count: 3452, date: Date()),
    Step(count: 123, date: Date()),
    Step(count: 1223, date: Date()),
    Step(count: 5223, date: Date()),
    Step(count: 12023, date: Date())
  ]
}
