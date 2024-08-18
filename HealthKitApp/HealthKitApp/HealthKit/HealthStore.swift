//
//  HealthStore.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 04.05.21.
//

import Foundation
import HealthKit

class HealthStore {
  var healthStore: HKHealthStore?
  var query: HKStatisticsCollectionQuery?
  
  init() {
    // Create actual HKHealthStore on creation.
    if HKHealthStore.isHealthDataAvailable() {
      healthStore = HKHealthStore()
    }
  }
  
  /// Returns the saved steps in the HealthKit.
  func calculateSteps(
    completion: @escaping (HKStatisticsCollection?) -> Void
  ) {
    let stepType = HKQuantityType.quantityType(
      forIdentifier: HKQuantityTypeIdentifier.stepCount
    )!
    
    let startDate = Calendar.current.date(
      byAdding: .day,
      value: -6,
      to: Date()
    )
    let anchorDate = Date.mondayAt12AM()
    let daily = DateComponents(day: 1)
    
    let predicate = HKQuery.predicateForSamples(
      withStart: startDate,
      end: Date(),
      options: .strictStartDate
    )
    
    query = HKStatisticsCollectionQuery(
      quantityType: stepType,
      quantitySamplePredicate: predicate,
      options: .cumulativeSum,
      anchorDate: anchorDate,
      intervalComponents: daily
    )
    
    query!.initialResultsHandler = { query, statisticsCollection, error in
      completion(statisticsCollection)
    }
    
    if let healthStore = healthStore, let query = query {
      healthStore.execute(query)
    }
  }
  
  func requestAuthorization(
    completion: @escaping (Bool) -> Void
  ) {
    let stepType = HKQuantityType.quantityType(
      forIdentifier: HKQuantityTypeIdentifier.stepCount
    )!
    
    guard let healthStore = self.healthStore else {
      return completion(false)
    }
    
    healthStore.requestAuthorization(
      toShare: [],
      read: [stepType]
    ) { success, error in
      completion(success)
    }
  }
}
