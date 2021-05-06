//
//  AllStepsViewModel.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 06.05.21.
//

import Foundation
import HealthKit

class AllStepsViewModel: ObservableObject {
  @Published private(set) var state = AllStepsViewState()
  private var healthStore: HealthStore?
  
  init() {
    healthStore = HealthStore()
    loadData()
  }
  
  private func loadData() {
    // Create custom HealthStore
    if let healthStore = healthStore {
      
      // Request permission from User. A standard iOS
      // HealthKit Permission Overlay will appear.
      healthStore.requestAuthorization { success in
        
        // Permission Granted.
        if success {
          
          // Get actual data we want to display.
          healthStore.calculateSteps { statisticsCollection in
            if let statisticsCollection = statisticsCollection {
              self.updateUIFromStatistics(
                statisticsCollection: statisticsCollection
              )
            }
          }
        }
      }
    }
  }
  
  private func updateUIFromStatistics(
    statisticsCollection: HKStatisticsCollection
  ) {
    // Get dates we want to display. The display should
    // begin 7 days ago, and end on the current day.
    let startDate = Calendar.current.date(
      byAdding: .day,
      value: -7, to: Date()
    )!
    let endDate = Date()
    
    statisticsCollection.enumerateStatistics(
      from: startDate,
      to: endDate
    ) { statistics, stop in
      let count = statistics.sumQuantity()?.doubleValue(for: .count())
      let step = Step(
        count: Int(count ?? 0),
        date: statistics.startDate
      )
      self.state.steps.append(step)
    }
  }
  
  struct AllStepsViewState {
    var steps = [Step]()
  }
}