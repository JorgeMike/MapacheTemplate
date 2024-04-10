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
        NavBarItem(icon: "bell.fill", index: 1, view: AnyView(NotificationsView())),
        NavBarItem(icon: "calendar", index: 2, view: AnyView(Text("Calendario"))),
        NavBarItem(icon: "chart.bar.fill", index: 3, view: AnyView(GraphicsView())),
        NavBarItem(icon: "sparkles", index: 4, view: AnyView(AIView())),
        NavBarItem(icon: "person.fill", index: 5, view: AnyView(Text("Perfil"))),
           ]
    
    var body: some View {
        NavBar(items: items)
    }
}

#Preview {
    ContentView()
}
