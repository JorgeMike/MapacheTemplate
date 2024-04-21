//
//  BusinessTip.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 10/04/24.
//

import SwiftUI

struct Tip {
    let title: String
    let body: String
    let icon: String // Nombre del sistema del icono, si es necesario
}

struct BusinessTip: View {
    @State private var selectedIndex = 0
    let tips: [Tip]

    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                ForEach(tips.indices, id: \.self) { index in
                    let tip = tips[index]
                    HStack(alignment: .top) {
                        Image(systemName: tip.icon)
                            .foregroundColor(.blue)
                            .padding(.bottom, 2)
                        
                        VStack(alignment: .leading) {
                            Text(tip.title)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                
                            Text(tip.body)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                        }
                        
                        Spacer() // Empuja el contenido a la izquierda
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
                    .tag(index)
                    .padding(.horizontal, 10)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 100)
            
            CustomPageControl(numberOfPages: tips.count, currentPage: $selectedIndex)
        }
    }
}

struct CustomPageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
        HStack {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .fill(currentPage == index ? Color.blue : Color.gray)
                    .frame(width: 8, height: 8)
            }
        }
        // Se mantiene centrado por defecto, no es necesario agregar padding o alineación
    }
}

struct BusinessTip_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTips = [
            Tip(title: "¡Un producto está apunto de agotarse!", body: "Papas sabritas 25g está a punto de agotarse, quedan 8 unidades", icon: "sparkles"),
            Tip(title: "¡Un producto está apunto de agotarse!", body: "Papas sabritas 25g está a punto de agotarse, quedan 8 unidades", icon: "sparkles"),
            // ... más tips según sea necesario
        ]
        
        BusinessTip(tips: sampleTips)
    }
}
