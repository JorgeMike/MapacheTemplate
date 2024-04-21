//
//  BarChart.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 12/04/24.
//

import SwiftUI

// Define una estructura para los datos de cada barra.
struct BarData {
    var text: String
    var value: CGFloat
}

struct BarView: View {
    var data: BarData
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 20, height: data.value)
            Text(data.text)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct BarChart: View {
    let barValues: [BarData]
    @State private var selectedBar: BarData?
    
    var body: some View {
        VStack {
            Text("2024")
                .padding(.top, 30)
                .font(.title)
            if let selectedBar = selectedBar {
                Text("\(selectedBar.text): \(selectedBar.value)")
            }
            HStack(alignment: .bottom, spacing: 8) {
                Spacer()
                ForEach(barValues, id: \.text) { barData in
                    BarView(data: barData)
                        .onTapGesture {
                            self.selectedBar = barData
                        }
                }
                Spacer()
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 1, y: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let barValues: [BarData] = [
            .init(text: "Jun", value: 100),
            .init(text: "Jul", value: 120),
            .init(text: "Ago", value: 80),
            .init(text: "Sep", value: 110),
            .init(text: "Oct", value: 130),
            .init(text: "Nov", value: 90),
            .init(text: "Dic", value: 150)
        ]
        let barValuesWeeks: [BarData] = [
            .init(text: "1 al 5", value: 60),
            .init(text: "6 al 10", value: 40),
            .init(text: "11 al 15", value: 80),
            .init(text: "16 al 20", value: 110),
            .init(text: "21 al 25", value: 130),
            .init(text: "26 al 30", value: 90),
        ]
        
        BarChart(barValues: barValuesWeeks)
    }
}
