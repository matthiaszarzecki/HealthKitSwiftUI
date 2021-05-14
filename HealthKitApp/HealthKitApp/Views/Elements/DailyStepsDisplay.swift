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
    Text(verbatim: "Today: \(stepAmount) / \(dailyGoal)")
      .padding()
      .frame(width: width, height: 56)
      .foregroundColor(.white)
      .backgroundColor(.dailyStepsBlue)
      .mask(RoundedRectangle(cornerRadius: 36, style: .continuous))
  }
}

struct DailyStepsDisplay_Previews: PreviewProvider {
  static var previews: some View {
    DailyStepsDisplay(
      stepAmount: MockClasses.stepAmount7000,
      dailyGoal: MockClasses.dailyGoal,
      width: PreviewConstants.width
    )
  }
}
