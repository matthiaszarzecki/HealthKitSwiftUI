//
//  GraphView.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 04.05.21.
//

import SwiftUI

struct GraphView: View {
  let steps: [Step]
  
  private var totalSteps: Int {
    steps.map { $0.count }.reduce(0, +)
  }
  
  var body: some View {
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
  }
}

struct GraphView_Previews: PreviewProvider {
  static var previews: some View {
    GraphView(steps: MockClasses.steps)
      .previewLayout(.sizeThatFits)
  }
}
