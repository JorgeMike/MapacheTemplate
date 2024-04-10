//
//  HomeView.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 08/04/24.
//

import SwiftUI

struct HomeView: View {
    let items = [
        CarouselItemModel(image: "portada1", title: "Imagen 1", numberOfStars: 3),
        CarouselItemModel(image: "portada2", title: "Imagen 2", numberOfStars: 5),
        CarouselItemModel(image: "portada4", title: "Imagen 3", numberOfStars: 4)
    ]
    
    var body: some View {
        VStack {
            
            HStack{
                VStack(alignment: .leading){
                    Text("¡Hola Miguel!")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                    Text("Bienvenido")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                }
                Spacer()
            }.padding(.bottom)
                        
            DashboardSummaryView(totalSales: 100, totalTransactions: 200, inventoryLevel: 300, mes: "Febrero")
            
            TopSellingProduct(nameImage: "sabritas", productName: "Sabritas 25g", unitsSold: 150, unitPrice: 18, earnings: 2700)
            
            InventoryProgress(percentageUsed: 0.43)
            
            BusinessTip(tip: "Considera ajustar tus precios durante los horarios pico para maximizar las ganancias.")
            
            // Carrusel(items: items)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
