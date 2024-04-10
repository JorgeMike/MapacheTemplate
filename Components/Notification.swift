//
//  Notification.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 10/04/24.
//

import SwiftUI

struct NotificationData {
    var title: String
    var message: String
}

struct NotificationView: View {
    let section: String
    let notifications: [NotificationData]
    
    var body: some View {
        VStack {
            Text(section)
                .font(.headline)
                .padding()

            ForEach(notifications, id: \.title) { notification in
                VStack(alignment: .leading) {
                    Text(notification.title)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    Text(notification.message)
                        .font(.body)
                    Divider()
                }
                .padding(.horizontal)
            }
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(
            section: "Inventario",
            notifications: [
                NotificationData(title: "Nivel bajo de stock", message: "El producto 'X' tiene solo 5 unidades restantes."),
                NotificationData(title: "Reabastecimiento necesario", message: "Es hora de reordenar el producto 'Camiseta deportiva Y'.")
            ]
        )
    }
}
