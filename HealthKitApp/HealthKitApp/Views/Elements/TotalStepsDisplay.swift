//
//  TotalStepsDisplay.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 11.05.21.
//

import SwiftUI

struct TotalStepsDisplay: View {
  var steps: [Step]
  var width: CGFloat
  
  private var totalSteps: Int {
    steps.map { $0.count }.reduce(0, +)
  }
  
  var body: some View {
    Text(verbatim: "Last 7 Days: \(totalSteps)")
      .padding()
      .frame(width: width, height: 56)
      .foregroundColor(.white)
      .backgroundColor(.dailyStepsBlue)
      .mask(RoundedRectangle(cornerRadius: 36, style: .continuous))
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  TotalStepsDisplay(
    steps: .mockSteps,
    width: .previewWidth
  )
  .padding()
}
