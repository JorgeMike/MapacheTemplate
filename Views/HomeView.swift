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
    let sampleTips = [
        Tip(title: "¡Un producto está apunto de agotarse!", body: "Papas sabritas 25g está a punto de agotarse, quedan 8 unidades", icon: "sparkles"),
        Tip(title: "¡Un producto está apunto de agotarse!", body: "Papas sabritas 25g está a punto de agotarse, quedan 8 unidades", icon: "sparkles"),
        // Agrega más tips según sea necesario
    ]
    let products: [Product] = [
        Product(name: "Papas sabritas", volume: 55, unitOfMeasure: "g", price: 18, brand: "Sabritas", category: "Botana", image: "sabritas", stock: 13),
        Product(name: "Coca-Cola", volume: 3 , unitOfMeasure: "L", price: 28, brand: "CocaCola", category: "Refrescos", image: "cocaCola3L", stock: 6),
        Product(name: "Papas sol", volume: 100 , unitOfMeasure: "g", price: 20, brand: "Sol", category: "Botana", image: "papasSolLimon", stock: 6)
    ]
    
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Text("¡Hola Miguel!")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Text("Bienvenido")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                }
                Spacer()
            }.padding(.bottom)
                        
            DashboardSummaryView(totalSales: 100, totalTransactions: 200, inventoryLevel: 300, mes: "Febrero")
            
            TopSellingProduct(nameImage: "sabritas", productName: "Sabritas 25g", unitsSold: 150, unitPrice: 18, earnings: 2700)
            
            NavigationLink(destination: InventoryView(products: products)){
                InventoryProgress(percentageUsed: 0.43)
            }
            
            BusinessTip(tips: sampleTips)
            
            // Carrusel(items: items)
            
            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
