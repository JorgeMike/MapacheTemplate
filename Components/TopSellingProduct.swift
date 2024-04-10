import SwiftUI

struct TopSellingProduct: View {
    var nameImage:String
    var productName: String
    var unitsSold: Int
    var unitPrice: Double
    var earnings: Double

    var body: some View {
        VStack(alignment: .leading) {
             Text("Producto mas vendido")
                 .font(.headline)
                 .padding(.bottom, 5)

             HStack {
                 Image(nameImage)
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 100, height: 100)
                     .cornerRadius(8)
                 
                 Spacer()
                 
                 VStack(alignment: .leading) {
                     Text(productName)
                         .font(.title3)
                         .fontWeight(.semibold)

                     Text("Unidades Vendidas:  \(unitsSold)")
                         .font(.subheadline)
                         .foregroundColor(.secondary)

                     Text("Precio Unitario: $\(unitPrice, specifier: "%.2f")")
                         .font(.subheadline)
                         .foregroundColor(.secondary)
                     
                     Text("Ganancias: $\(earnings, specifier: "%.2f")")
                         .font(.subheadline)
                         .fontWeight(.bold)
                 }
             }
         }
        .padding()
        .background(Color.purple.opacity(0.05))
        .cornerRadius(10)
        
    }
}

struct TopSellingProductView_Previews: PreviewProvider {
    static var previews: some View {
        TopSellingProduct(nameImage: "sabritas", productName: "Sabritas 25g",
                          unitsSold: 150,
                          unitPrice: 18,
                          earnings: 2700)
    }
}
