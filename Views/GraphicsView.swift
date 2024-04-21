//
//  HomeView.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 08/04/24.
//

import SwiftUI

struct GraphicsView: View {
    let barValuesMonths: [BarData] = [
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
    
    var body: some View {
        VStack {
            //PieChart(slices: [
            //    PieSliceData(startAngle: .degrees(0), endAngle: .degrees(100), color: .red),
            //    PieSliceData(startAngle: .degrees(100), endAngle: .degrees(150), color: .green),
            //    PieSliceData(startAngle: .degrees(150), endAngle: .degrees(360), color: .blue)
            //])
            //.frame(width: 200, height: 200)
                        
            Tabs(tabItems: [
                TabItem(title: "Anual", content: AnyView(BarChart(barValues: barValuesMonths))),
                TabItem(title: "Mensual", content: AnyView(BarChart(barValues: barValuesWeeks)))
            ])
        }
        .padding()
    }
}

#Preview {
    GraphicsView()
}
