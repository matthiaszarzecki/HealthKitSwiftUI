//
//  StepBar.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 04.05.21.
//

import SwiftUI

struct StepBar: View {
  var step: Step
  
  private let dailyGoal = 7000
  
  private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "d.M"
    return formatter
  }()
  
  var body: some View {
    let barHeight = Swift.min(step.count/40, 300)
    
    VStack {
      Text("\(step.count)")
        .font(.caption)
        .foregroundColor(Color.white)
      
      let color: Color = step.count > dailyGoal ? .green : .red
      let width: CGFloat = 20
      
      Rectangle()
        .fill(color)
        .frame(width: width, height: CGFloat(barHeight))
        .mask(RoundedRectangle(cornerRadius: width/2, style: .continuous))
        .shadow(radius: 10)
      
      if Calendar(identifier: .iso8601).isDateInToday(step.date) {
        Text("Today")
          .font(.caption)
          .foregroundColor(Color.white)
          .shadow(radius: 10)
      } else {
        Text("\(step.date, formatter: dateFormatter)")
          .font(.caption)
          .foregroundColor(Color.white)
          .shadow(radius: 10)
      }
    }
  }
}

struct StepBar_Previews: PreviewProvider {
  static var previews: some View {
    StepBar(step: MockClasses.stepLessThan10000Steps)
      .padding()
      .backgroundColor(.dailyStepsBlue)
      .previewLayout(.sizeThatFits)
    
    StepBar(step: MockClasses.stepMoreThan10000Steps)
      .padding()
      .backgroundColor(.dailyStepsBlue)
      .previewLayout(.sizeThatFits)
  }
}
