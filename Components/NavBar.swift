//
//  NavBar.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 08/04/24.
//

import SwiftUI

struct NavBarItem {
    var icon: String
    var index: Int
    var view: AnyView
}

struct NavBar: View {
    var items: [NavBarItem]
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        ZStack(alignment: .center){
            
            items[selectedIndex].view
            
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 0) {
                    Divider()
                    HStack(alignment: .center, spacing: 0) {
                        ForEach(items, id: \.index) { item in
                            Button(action: {
                                selectedIndex = item.index
                            }) {
                                Image(systemName: item.icon)
                                    .foregroundColor(selectedIndex == item.index ? .blue : .gray)
                                    .padding()
                            }
                        }
                    }
                }.background(.white)
            }
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        let items = [
            NavBarItem(icon: "house.fill", index: 0, view: AnyView(Text("Home"))),
            NavBarItem(icon: "magnifyingglass", index: 1, view: AnyView(NotificationsView())),
            NavBarItem(icon: "person.fill", index: 2, view: AnyView(Text("Perfil"))),
            NavBarItem(icon: "chart.bar", index: 3, view: AnyView(Text("graficas"))),
            NavBarItem(icon: "sparkles", index: 4, view: AnyView(Text("IA")))
               ]

        NavBar(items: items)
    }
}
