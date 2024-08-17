//
//  DailyGoalDisplay.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 14.05.21.
//

import SwiftUI

struct DailyGoalDisplay: View {
  var dailyGoal: Int
  let width: CGFloat
  var saveGoal: (Int) -> Void
  
  var body: some View {
    HStack {
      Text(verbatim: "Daily Goal")
        .padding()
        .foregroundColor(.white)
      
      Button(
        action: {
          adaptDailyGoal(amount: -500)
        },
        label: {
          Image(systemName: "minus")
            .frame(width: 30, height: 30, alignment: .center)
            .backgroundColor(.gray)
            .foregroundColor(.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
      )
      
      Text(verbatim: "\(dailyGoal)")
        .padding()
        .foregroundColor(.white)
      
      Button(
        action: {
          adaptDailyGoal(amount: 500)
        },
        label: {
          Image(systemName: "plus")
            .frame(width: 30, height: 30, alignment: .center)
            .backgroundColor(.gray)
            .foregroundColor(.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
      )
    }
    .frame(width: width, height: 56)
    .backgroundColor(.dailyStepsBlue)
    .mask(RoundedRectangle(cornerRadius: 36, style: .continuous))
  }
  
  func adaptDailyGoal(amount: Int) {
    var newGoal = dailyGoal + amount
    if newGoal < 0 {
      newGoal = 0
    }
    withAnimation {
      saveGoal(newGoal)
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  DailyGoalDisplay(
    dailyGoal: .mockDailyGoal,
    width: .previewWidth,
    saveGoal: {_ in }
  )
  .padding()
}
