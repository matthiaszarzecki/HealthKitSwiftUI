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
      refreshStepReadout: allStepsViewModel.loadData
    )
  }
}

struct AllStepsDisplay: View {
  var steps: [Step]
  var refreshStepReadout: () -> Void
  
  var body: some View {
    GeometryReader { geometry in
      NavigationView {
        VStack {
          StepsDisplay(
            steps: steps,
            width: geometry.size.width - 16*2
          )
          TotalStepsDisplay(
            steps: steps,
            width: geometry.size.width - 16*2
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
      refreshStepReadout: {}
    )
  }
}
