import SwiftUI

struct InventoryProgress: View {
    var percentageUsed: Float // Un número entre 0 y 1

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Nivel de inventario")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 1)
                
                Text("Algunos productos se están agotando más rápido, clic para ver")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding(.leading)

            Spacer()
            
            Percentage(percentageUsed: 0.32)
        }
        .frame(height: 80)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .leading, endPoint: .trailing))
                .shadow(radius: 5)
        )
    }
}

struct InventoryProgressView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryProgress(percentageUsed: 0.3) // Example of 30% used
    }
}
