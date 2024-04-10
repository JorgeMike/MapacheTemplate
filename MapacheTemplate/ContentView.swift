//
//  ContentView.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 05/04/24.
//

import SwiftUI

struct ContentView: View {
    
    let items = [
        NavBarItem(icon: "house.fill", index: 0, view: AnyView(HomeView())),
        NavBarItem(icon: "magnifyingglass", index: 1, view: AnyView(Text("Busqueda"))),
        NavBarItem(icon: "person.fill", index: 2, view: AnyView(Text("Perfil"))),
        NavBarItem(icon: "chart.bar", index: 3, view: AnyView(GraphicsView())),
        NavBarItem(icon: "sparkles", index: 4, view: AnyView(AIView()))
           ]
    
    var body: some View {
        NavBar(items: items)
    }
}
#Preview {
    ContentView()
}
