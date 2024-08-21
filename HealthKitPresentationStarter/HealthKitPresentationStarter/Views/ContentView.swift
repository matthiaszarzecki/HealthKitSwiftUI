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
          action: loadData,
          label: {
            Text("Get Health Data")
          }
        )
      }
      .padding()
    }
    .padding()
  }

  private func loadData() {

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
