//
//  ContentView.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 04.05.21.
//

import SwiftUI

struct AllStepsView: View {
  @ObservedObject private var allStepsViewModel = AllStepsViewModel()
  
  var body: some View {
    AllStepsDisplay(
      steps: allStepsViewModel.state.steps,
      refreshStepReadout: allStepsViewModel.loadData,
      saveGoal: allStepsViewModel.saveGoal,
      dailyGoal: allStepsViewModel.state.dailyGoal
    )
  }
}

struct AllStepsDisplay: View {
  var steps: [Step]
  var refreshStepReadout: () -> Void
  var saveGoal: (Int) -> Void
  var dailyGoal: Int
  
  var body: some View {
    GeometryReader { geometry in
      NavigationView {
        VStack {
          DailyStepsDisplay(
            stepAmount: steps.last?.count ?? 0,
            dailyGoal: dailyGoal,
            width: geometry.size.width - 16*2
          )
          StepsDisplay(
            steps: steps,
            dailyGoal: dailyGoal,
            width: geometry.size.width - 16*2
          )
          TotalStepsDisplay(
            steps: steps,
            width: geometry.size.width - 16*2
          )
          DailyGoalDisplay(
            dailyGoal: dailyGoal,
            width: geometry.size.width - 16*2,
            saveGoal: saveGoal
          )
        }
        .navigationTitle("Your Current Steps")
      }
    }
    .onReceive(
      NotificationCenter.default.publisher(
        for: UIApplication.willEnterForegroundNotification)
    ) { _ in
      print("### Checking for update after putting app into foreground")
      refreshStepReadout()
    }
  }
}

struct AllStepsView_Previews: PreviewProvider {
  static var previews: some View {
    AllStepsDisplay(
      steps: MockClasses.steps,
      refreshStepReadout: {},
      saveGoal: {_ in },
      dailyGoal: MockClasses.dailyGoal
    )
  }
}
