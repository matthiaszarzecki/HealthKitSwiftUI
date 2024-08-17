//
//  CircularProgressBar.swift
//  HealthKitApp
//
//  Created by Matthias Zarzecki on 14.05.21.
//

import SwiftUI

struct CircularProgressBar: View {
  var progress: Double
  var size: CGFloat
  
  var body: some View {
    let lineWidth: CGFloat = 12
    ZStack {
      Circle()
        .stroke(lineWidth: lineWidth)
        .opacity(0.3)
        .foregroundColor(.white)
      
      Circle()
        .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
        .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
        .foregroundColor(.white)
        .rotationEffect(Angle(degrees: 270.0))
        .animation(.linear)
      
      Text(String(format: "%.0f%%", min(self.progress, 1.0) * 100.0))
        .foregroundColor(.white)
        .font(.system(size: 16))
        .bold()
    }
    .padding()
    .frame(width: size, height: size, alignment: .center)
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  CircularProgressBar(
    progress: 0.23,
    size: 100
  )
  .padding()
  .backgroundColor(.green)
}
