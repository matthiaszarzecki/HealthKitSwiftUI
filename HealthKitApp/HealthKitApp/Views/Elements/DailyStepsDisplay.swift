//
//  DailyStepsDisplay.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 14.05.21.
//

import SwiftUI

struct DailyStepsDisplay: View {
  let stepAmount: Int
  let dailyGoal: Int
  let width: CGFloat
  
  var body: some View {
    HStack {
      let progress = Double(stepAmount) / Double(dailyGoal)
      CircularProgressBar(
        progress: progress,
        size: 100
      )
      
      Text(verbatim: "\(stepAmount) / \(dailyGoal)")
        .font(.title)
        .padding()
        .foregroundColor(.white)
    }
    .frame(width: width, height: 100)
    .backgroundColor(.dailyStepsBlue)
    .mask(RoundedRectangle(cornerRadius: 36, style: .continuous))
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  DailyStepsDisplay(
    stepAmount: .mockStepAmount7000,
    dailyGoal: .mockDailyGoal,
    width: .previewWidth
  )
  .padding()
}
