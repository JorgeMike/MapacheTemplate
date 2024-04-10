//
//  BusinessTip.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 10/04/24.
//

import SwiftUI

struct BusinessTip: View {
    var tip: String
    
    var body: some View {
        HStack {
            Image(systemName: "lightbulb.fill")
                .foregroundColor(.yellow)
                .padding()
            
            Text(tip)
                .font(.body)
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.purple.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct BusinessTip_Previews: PreviewProvider {
    static var previews: some View {
        BusinessTip(tip: "Considera ajustar tus precios durante los horarios pico para maximizar las ganancias.")
    }
}
