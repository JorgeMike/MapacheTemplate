//
//  Percentage.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 21/04/24.
//

import SwiftUI

struct Percentage: View {
    var percentageUsed: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 8)
                .opacity(0.3)
                .foregroundColor(Color.white)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.percentageUsed, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.white)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: percentageUsed)

            Text(String(format: "%.0f%%", min(self.percentageUsed, 1.0)*100))
                .font(.headline)
                .foregroundColor(.white)
                .animation(.none)
        }
        .frame(width: 50, height: 50)
        .padding()
    }
}

#Preview {
    Percentage(percentageUsed: 0.32)
}
