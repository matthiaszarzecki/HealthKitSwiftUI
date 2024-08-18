//
//  ContentView.swift
//  HealthKitPresentationStarter
//
//  Created by Matthias Zarzecki on 18.08.24.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject private var allStepsViewModel = AllStepsViewModel()

  var body: some View {
    VStack {
      VStack {
        Image(systemName: "heart.fill")
          .imageScale(.large)
          .foregroundStyle(Color.red)


        Text("StepData: \(allStepsViewModel.steps)")

        Button(
          action: allStepsViewModel.loadData,
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

class AllStepsViewModel: ObservableObject {
  @Published private(set) var steps: [Step] = []

  func loadData() {

  }
}

#Preview {
  ContentView()
}
