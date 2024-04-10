//
//  HomeView.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 08/04/24.
//

import SwiftUI

struct GraphicsView: View {
    
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
            }
                        
            PieChart(slices: [
                PieSliceData(startAngle: .degrees(0), endAngle: .degrees(100), color: .red),
                PieSliceData(startAngle: .degrees(100), endAngle: .degrees(150), color: .green),
                PieSliceData(startAngle: .degrees(150), endAngle: .degrees(360), color: .blue)
            ])
            .frame(width: 200, height: 200)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
