import SwiftUI

struct InventoryProgress: View {
    var percentageUsed: Float // Un número entre 0 y 1

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .leading, endPoint: .trailing))
                .frame(height: 80)
                .shadow(radius: 5)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Nivel de inventario")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom, 1)
                    
                    Text("Algunos productos se estan agotando mas rapido, clic para ver")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .padding(.leading)

                Spacer()
                
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
    }
}

struct InventoryProgressView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryProgress(percentageUsed: 0.3) // Example of 30% used
    }
}
