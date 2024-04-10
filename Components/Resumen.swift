//
//  Resumen.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 08/04/24.
//

import SwiftUI

struct ResumenStruct {
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
}

struct Resumen: View {
    var body: some View {
        Text("Componente que busca hacer un resumen del ultimo mes")
    }
}

struct Resumen_Previews: PreviewProvider {
    static var previews: some View {
        Resumen()
    }
}
