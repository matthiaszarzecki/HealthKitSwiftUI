//
//  StepsDisplay.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 11.05.21.
//

import SwiftUI

struct StepsDisplay: View {
  let steps: [Step]
  let dailyGoal: Int
  let width: CGFloat
  
  var body: some View {
    HStack(alignment: .lastTextBaseline) {
      ForEach(steps, id: \.id) { step in
        StepBar(step: step, dailyGoal: dailyGoal)
      }
    }
    .frame(width: width, height: 400)
    .backgroundColor(.dailyStepsBlue)
    .mask(RoundedRectangle(cornerRadius: 36, style: .continuous))
  }
}

struct StepsDisplay_Previews: PreviewProvider {
  static var previews: some View {
    StepsDisplay(
      steps: .mockSteps,
      dailyGoal: .mockDailyGoal,
      width: .previewWidth
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
