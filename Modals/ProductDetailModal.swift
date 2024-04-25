//
//  ProductDetailModal.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 21/04/24.
//

import SwiftUI

struct ProductDetailModal: View {
    @State private var product: Product  // Use @State for local mutable state
    let lowStockThreshold: Int = 5
    
    public init(product: Product) {
        _product = State(initialValue: product)
    }

    var body: some View {
        VStack {
            // Sección de contenido desplazable
            ScrollView {
                VStack {
                    Image(product.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.bottom, 20)
                    
                    Divider()
                    
                    stockStatusView
                    
                    productDetailsView
                    
                    Text("Estadísticas del Producto")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 15)
                    
                    // Sección de estadísticas con valores de ejemplo
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Ventas Totales: 320 unidades")
                        Text("Ganancias: $2,560.00")
                        Text("Historial de Precios: $7.00 - $8.50")
                        Text("Rotación de Inventario: cada 15 días")
                        Text("Comparativa de Ventas: 20% aumento vs mes anterior")
                        Text("Tiempo en Inventario: 10 días promedio")
                        Text("Demanda Pronosticada: 350 unidades para el próximo mes")
                        Text("Rentabilidad por Producto: 35%")
                        Text("Productos Complementarios: Refrescos, Botanas")
                        Text("Patrones de Compra de Clientes: Mayormente fines de semana")
                        Text("Alertas de Stock Bajo: 25 unidades restantes")
                        Text("Análisis de Tendencias: Ventas en aumento")
                        Text("Valoración de Reseñas: 4.5 estrellas")
                    }
                    .padding()
                }
                .padding()
                .cornerRadius(10)
            }
            
            Spacer()

            stockAdjustmentButtons
        }
    }
    
    private var stockStatusView: some View {
        Group {
            if product.stock == 0 {
                lowStockText("Producto agotado", color: .red)
            } else if product.stock <= lowStockThreshold {
                lowStockText("Stock bajo", color: .yellow)
            }
        }
    }

    private var productDetailsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(product.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Spacer()
                Text(String(format: "%.1f %@", product.volume, product.unitOfMeasure))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Text("\(product.brand) - \(product.category)")
                .font(.headline)
                .foregroundColor(.secondary)

            Text(String(format: "$%.2f", product.price))
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var stockAdjustmentButtons: some View {
        HStack(spacing: 10) {
            HStack {
                Button(action: {
                    if product.stock > 0 {
                        product.stock -= 1
                    }
                }) {
                    Image(systemName: "minus.square.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 30))
                }
                
                Text("Stock: \(product.stock)")
                    .foregroundColor(product.stock > 0 ? .green : .red)
                    .font(.system(size: 20))
                
                Button(action: {
                    product.stock += 1
                }) {
                    Image(systemName: "plus.square.fill")
                        .foregroundColor(.green)
                        .font(.system(size: 30))
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 1, y: 2)
            
            HStack {
                Button(action: {
                    // acción para el botón
                }) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.blue)
                        .font(.system(size: 26))
                }
                .padding(10)
            }
            .frame(width: 50) // Ajusta este valor según necesites
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 1, y: 2)
        }
    }


    private func lowStockText(_ text: String, color: Color) -> some View {
        Text(text)
            .padding()
            .frame(maxWidth: .infinity)
            .background(color.opacity(0.1))
            .foregroundColor(.black)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(color, lineWidth: 1)
            )
    }
}

struct ProductDetailModal_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailModal(product: Product(name: "Papas Sabritas", volume: 55, unitOfMeasure: "g", price: 18, brand: "Sabritas", category: "Botana", image: "sabritas", stock: 10))
    }
}

