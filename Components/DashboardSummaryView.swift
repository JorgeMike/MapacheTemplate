//
//  DashboardSummaryView.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 10/04/24.
//

import SwiftUI

struct DashboardSummaryView: View {
    var totalSales: Double
    var totalTransactions: Int
    var inventoryLevel: Int
    var mes: String
    
    var body: some View {
        VStack(alignment: .leading) {
             Text("Resumen de \(mes)")
                 .font(.headline)
                 .padding(.bottom, 5)

             HStack {
                 VStack(alignment: .leading) {
                     Text("Ventas Totales")
                     Text(String(format: "$%.2f", totalSales))
                         .font(.title)
                 }
                 Spacer()
                 VStack(alignment: .leading) {
                     Text("Transacciones")
                     Text("\(totalTransactions)")
                         .font(.title)
                 }
             }
         }
        .padding()
        .background(Color.purple.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    DashboardSummaryView(totalSales: 100, totalTransactions: 200, inventoryLevel: 300, mes: "Enero")
}
