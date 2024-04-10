//
//  NotificationsView.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 10/04/24.
//

import SwiftUI

struct NotificationsView: View {
    // Datos de ejemplo para las notificaciones
    let notificationsData = [
        ("Inventario", [
            NotificationData(title: "Nivel bajo de stock", message: "El producto 'Zapatos deportivos modelo X' tiene solo 5 unidades restantes."),
            NotificationData(title: "Reabastecimiento necesario", message: "Es hora de reordenar el producto 'Camiseta deportiva Y'.")
        ]),
        ("Finanzas", [
            NotificationData(title: "Factura pendiente", message: "La factura #12345 vence en 3 días."),
            NotificationData(title: "Nuevo reporte financiero disponible", message: "El reporte financiero del Q1 está ahora disponible.")
        ]),
        ("Pedidos", [
            NotificationData(title: "Pedido #78910 confirmado", message: "El pedido #78910 ha sido confirmado y está en preparación."),
            NotificationData(title: "Pedido #78911 entregado", message: "El pedido #78911 ha sido entregado al cliente.")
        ]),
        ("Marketing", [
            NotificationData(title: "Campaña de verano", message: "La campaña de marketing de verano está lista para lanzarse."),
            NotificationData(title: "Análisis de campaña", message: "El análisis de la última campaña de marketing está disponible.")
        ])
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Notificaciones")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                    .padding(.leading)

                ForEach(notificationsData, id: \.0) { section, data in
                    NotificationView(section: section, notifications: data)
                }
            }
        }.padding(.bottom, 40)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
