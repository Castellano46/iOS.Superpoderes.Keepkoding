//
//  EmpleadoRowView.swift
//  Multiplataforma
//
//  Created by Pedro on 4/11/23.
//

import SwiftUI

struct EmpleadoRowView: View {
    
    let employee: Empleados
    
    var body: some View {
        Text("\(employee.nombre)")
        
    }
}

#Preview {
    EmpleadoRowView(employee: Empleados(id: "100", nombre: "Pedro", apell1: "Liebana", apell2: "Castellano", idPhoto: "34", edad: 33))
        .frame(width: 400.0, height: 200.0)
}

