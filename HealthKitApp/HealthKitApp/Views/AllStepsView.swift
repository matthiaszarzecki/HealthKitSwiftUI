//
//  ContentView.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 04.05.21.
//

import SwiftUI
import HealthKit

struct AllStepsView: View {
  private var healthStore: HealthStore?
  @State private var steps = [Step]()
  
  init() {
    healthStore = HealthStore()
    //loadData()
  }
  
  var body: some View {
    AllStepsDisplay(steps: steps)
      .onAppear {
        loadData()
      }
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
              updateUIFromStatistics(
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
      steps.append(step)
    }
  }
}

struct AllStepsDisplay: View {
  var steps: [Step]
  
  var body: some View {
    NavigationView {
      GraphView(steps: steps)
        .navigationTitle("Your Current Steps")
    }
  }
}

struct AllStepsView_Previews: PreviewProvider {
  static var previews: some View {
    AllStepsDisplay(steps: MockClasses.steps)
  }
}
