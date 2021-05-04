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
