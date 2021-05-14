//
//  DailyGoalDisplay.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 14.05.21.
//

import SwiftUI

struct DailyGoalDisplay: View {
  @Binding var dailyGoal: Int
  let width: CGFloat
  
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
    withAnimation {
      dailyGoal += amount
      if dailyGoal < 0 {
        dailyGoal = 0
      }
    }
  }
}

struct DailyGoalDisplay_Previews: PreviewProvider {
  static var previews: some View {
    DailyGoalDisplay(
      dailyGoal: .constant(MockClasses.dailyGoal),
      width: PreviewConstants.width
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
