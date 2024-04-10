//
//  BarChart.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 10/04/24.
//

import SwiftUI

struct BarChart: View {
    var salesData: [Double]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ventas Semanales")
                .font(.headline)
                .padding(.leading)
            
            HStack(alignment: .bottom) {
                ForEach(salesData.indices, id: \.self) { index in
                    VStack {
                        Spacer()
                        Text("\(salesData[index], specifier: "%.2f")")
                            .font(.caption)
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 20, height: CGFloat(salesData[index]) * 5.0)
                        Text("Día \(index + 1)")
                            .font(.caption)
                    }
                }
            }
            .padding()
            .background(.red)
        }
        .padding(.horizontal)
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(salesData: [150, 230, 300, 250, 200, 190, 220])
    }
}

