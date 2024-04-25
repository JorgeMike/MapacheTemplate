//
//  InventoryView.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 20/04/24.
//

import SwiftUI

struct Product: Identifiable {
    var id = UUID() 
    var name: String
    var volume: Double
    var unitOfMeasure: String
    var price: Double
    var brand: String
    var category: String
    var image: String
    var stock: Int
}

struct InventoryView: View {
    let totalInventory = 2000
    let currentStock = 320
    let products: [Product]

    @State private var selectedProduct: Product?  // Product ahora es Identifiable
    
    var body: some View {
        VStack {
            ScrollView {
                InventoryStatus(totalInventory: totalInventory, currentStock: currentStock)
                    .padding()
                
                ForEach(products) { product in
                    HStack {
                        Image(product.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            HStack {
                                Text(product.name)
                                    .font(.headline)
                                Spacer()
                                Text(String(format: "$%.2f", product.price))
                                    .font(.subheadline)
                                    .padding(.horizontal, 10)
                            }

                            Text(String(format: "%.1f %@", product.volume, product.unitOfMeasure))
                            Text("Stock: \(product.stock)")
                                .font(.subheadline)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
                    .padding(.vertical, 4)
                    .padding(.horizontal)
                    .onTapGesture {
                        self.selectedProduct = product
                    }
                }
            }
            Spacer()
        }
        .sheet(item: $selectedProduct) { product in
            ProductDetailModal(product: product)
        }
    }
}

struct InventoryStatus: View {
    var totalInventory: Int
    var currentStock: Int

    // Calcula el porcentaje del inventario utilizado
    var inventoryPercentage: Double {
        if totalInventory == 0 {
            return 0
        }
        return Double(currentStock) / Double(totalInventory)
    }

    var body: some View {
        HStack {
            // Usa la propiedad calculada para pasar el porcentaje
            Percentage(percentageUsed: Float(inventoryPercentage))
            
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
        }
        .frame(height: 80)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .leading, endPoint: .trailing))
                .shadow(radius: 5)
        )
    }
}

// Vista previa con los valores de ejemplo
struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        let products: [Product] = [
            Product(name: "Papas sabritas", volume: 55, unitOfMeasure: "g", price: 18, brand: "Sabritas", category: "Botana", image: "sabritas", stock: 13),
            Product(name: "Coca-Cola", volume: 3 , unitOfMeasure: "L", price: 28, brand: "CocaCola", category: "Refrescos", image: "cocaCola3L", stock: 6),
            Product(name: "Papas sol", volume: 100 , unitOfMeasure: "g", price: 20, brand: "Sol", category: "Botana", image: "papasSolLimon", stock: 13),
            Product(name: "Gansito", volume: 55 , unitOfMeasure: "g", price: 22, brand: "Marinela", category: "Postres", image: "gansito", stock: 0)
        ]
        
        InventoryView(products: products)
    }
}
