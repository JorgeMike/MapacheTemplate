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
                .foregroundColor(.white)
            
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
            .foregroundColor(.white)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .leading, endPoint: .trailing))
                .shadow(radius: 5)
        )
        .cornerRadius(10)
    }
}

struct DashboardSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardSummaryView(totalSales: 100, totalTransactions: 200, inventoryLevel: 300, mes: "Enero")
    }
}
