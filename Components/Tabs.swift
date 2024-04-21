//
//  Tabs.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 21/04/24.
//

import SwiftUI

struct TabItem {
    var title: String
    var content: AnyView
}

struct Tabs: View {
    var tabItems: [TabItem]
    
    @State private var selectedTabIndex = 0
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                ForEach(tabItems.indices, id: \.self) { index in
                    Button(action: {
                        withAnimation {
                            self.selectedTabIndex = index
                        }
                    }) {
                        VStack(spacing: 4) {
                            Text(self.tabItems[index].title)
                                .font(.subheadline)
                                .foregroundColor(self.selectedTabIndex == index ? .blue : .gray)
                            
                            if self.selectedTabIndex == index {
                                RoundedRectangle(cornerRadius: 2)
                                    .frame(width: 50, height: 1) // Rectángulo más pequeño
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 10)
                            }
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(self.selectedTabIndex == index ? Color.blue.opacity(0.1) : Color.clear)
                        .cornerRadius(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(self.selectedTabIndex == index ? Color.blue : Color.gray, lineWidth: 1)
                        )
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            
            // Renderiza el contenido de la pestaña seleccionada.
            tabItems[selectedTabIndex].content
            
            Spacer()
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        let items = [
            TabItem(title: "Anual", content: AnyView(Text("Contenido Anual"))),
            TabItem(title: "Mensual", content: AnyView(Text("Contenido Mensual")))
        ]
        
        Tabs(tabItems: items)
    }
}
