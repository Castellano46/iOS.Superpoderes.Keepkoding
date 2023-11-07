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
        VStack{
            Spacer()
            Image(systemName: "person")
                .resizable()
                .frame(width: 100, height: 100)
            
            #if os(watchOS)
            
            HStack{
                Spacer()
                Text("\(employee.nombre)")
                Spacer()
            }
            
            #else
            
            HStack{
                Spacer()
                Text("\(employee.nombre) \(employee.apell1)")
                
                if let apell2 = employee.apell2{
                    Text("\(apell2)")
                }
                Spacer()
            }
            
            #endif
            
            Spacer()
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(25)
        .foregroundColor(.white)
    }
}

//macros de iOS 17.
/*
#Preview {
    EmpleadoRowView(employee: Empleados(id: "100", nombre: "jose luis", apell1: "bustos", apell2: "Esteban", idPhoto: "091", edad: 22))
        .previewLayout(.fixed(width: 400.0, height: 200.0))
}
 */


//code 14 y anterior
struct EmpleadoRowView_Previews: PreviewProvider {
    static var previews: some View{
        EmpleadoRowView(employee: Empleados(id: "046", nombre: "Pedro", apell1: "Liebana", apell2: "Castellano", idPhoto: "041", edad: 33))
            .previewLayout(.fixed(width: 400.0, height: 200.0))
    }
}

 
 
