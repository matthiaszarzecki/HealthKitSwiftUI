//
//  Step.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 04.05.21.
//

import Foundation

struct Step: Identifiable {
  let id = UUID()
  let count: Int
  let date: Date
}

extension Step {
  static let mockStepLessThan10000Steps = Step(count: 4213, date: Date())
  static let mockStepMoreThan10000Steps = Step(count: 14213, date: Date())
}

extension Array where Element == Step {
  static let mockSteps = [
    Step(count: 3452, date: Date()),
    Step(count: 123, date: Date()),
    Step(count: 1223, date: Date()),
    Step(count: 5223, date: Date()),
    Step(count: 12023, date: Date())
  ]
}
