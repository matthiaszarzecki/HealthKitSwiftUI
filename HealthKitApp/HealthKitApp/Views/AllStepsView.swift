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
    AllStepsDisplay(steps: allStepsViewModel.state.steps)
  }
}

struct AllStepsDisplay: View {
  var steps: [Step]
  
  private var totalSteps: Int {
    steps.map { $0.count }.reduce(0, +)
  }
  
  var body: some View {
    NavigationView {
      VStack {
        HStack(alignment: .lastTextBaseline) {
          ForEach(steps, id: \.id) { step in
            StepBar(step: step)
          }
        }
        
        Text("Total Steps: \(totalSteps)")
          .padding(.top, 100)
          .foregroundColor(.white)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.blue)
      .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
      .padding()
      .navigationTitle("Your Current Steps")
    }
  }
}

struct AllStepsView_Previews: PreviewProvider {
  static var previews: some View {
    AllStepsDisplay(steps: MockClasses.steps)
  }
}
