//
//  ContentView.swift
//  HealthKitPresentationStarter
//
//  Created by Matthias Zarzecki on 18.08.24.
//

import SwiftUI

struct ContentView: View {
  @State var steps: [Step] = []

  var body: some View {
    VStack {
      VStack {
        Image(systemName: "heart.fill")
          .imageScale(.large)
          .foregroundStyle(Color.red)

        Text("StepData: \(steps)")

        Button(
          action: {

          },
          label: {
            Text("Get Health Data")
          }
        )
      }
      .padding()
    }
    .padding()
  }
}

struct Step: Identifiable {
  let id = UUID()
  let count: Int
  let date: Date
}

#Preview {
  ContentView()
}

/*
 func loadData() {
   // Request permission from User. A standard iOS
   // HealthKit Permission Overlay will appear.
   healthStore.requestAuthorization { success in

     // Permission Granted.
     if success {

       // Get actual data we want to display.
       self.healthStore.calculateSteps { statisticsCollection in
         if let statisticsCollection = statisticsCollection {

           // Reset steps here for later fresh appending
           self.steps = []

           self.updateUIFromStatistics(
             statisticsCollection: statisticsCollection
           )
         }
       }
     }
   }
 }

 private func updateUIFromStatistics(
   statisticsCollection: HKStatisticsCollection
 ) {
   // Get dates we want to display. The display should
   // begin 6 days ago (0 indexed for 1 week total),
   // and end on the current day.
   let startDate = Calendar.current.date(
     byAdding: .day,
     value: -6, to: Date()
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
     self.steps.append(step)
   }
 }
 */

/*

 class HealthStore {
   var healthStore: HKHealthStore?

   init() {
     if HKHealthStore.isHealthDataAvailable() {
       healthStore = HKHealthStore()
     }
   }

   func requestAuthorization(
     completion: @escaping (Bool) -> Void
   ) {
     guard let healthStore = healthStore else {
       return completion(false)
     }

     guard let stepType = HKQuantityType.quantityType(
       forIdentifier: HKQuantityTypeIdentifier.stepCount
     ) else {
       return completion(false)
     }

     healthStore.requestAuthorization(
       toShare: [],
       read: [stepType]
     ) { success, error in
       completion(success)
     }
   }

   func calculateSteps(
     completion: @escaping (HKStatisticsCollection?) -> Void
   ) {
     guard let stepType = HKQuantityType.quantityType(
       forIdentifier: HKQuantityTypeIdentifier.stepCount
     ) else {
       completion(nil)
       return
     }

     let startDate = Calendar.current.date(
       byAdding: .day,
       value: -6,
       to: Date()
     )
     let anchorDate = Calendar(identifier: .iso8601).date(
       from: Calendar(
         identifier: .iso8601
       ).dateComponents(
         [.yearForWeekOfYear, .weekOfYear],
         from: Date()
       )
     )!
     let daily = DateComponents(day: 1)

     let predicate = HKQuery.predicateForSamples(
       withStart: startDate,
       end: Date(),
       options: .strictStartDate
     )

     let query = HKStatisticsCollectionQuery(
       quantityType: stepType,
       quantitySamplePredicate: predicate,
       options: .cumulativeSum,
       anchorDate: anchorDate,
       intervalComponents: daily
     )

     query.initialResultsHandler = { query, statisticsCollection, error in
       completion(statisticsCollection)
     }

     if let healthStore = healthStore {
       healthStore.execute(query)
     }
   }


 }
 */
