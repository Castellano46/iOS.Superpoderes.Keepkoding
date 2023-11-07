//
//  EmployeeDetailView.swift
//  Multiplataforma
//
//  Created by Pedro on 6/11/23.
//

import SwiftUI

struct EmployeeDetailView: View {
    let employee: Empleados
    
    var body: some View {
        
        ScrollView{
            VStack{
                
                //Imagen
                
            #if os(watchOS)
                
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
            #else
                
                Image(systemName: "person")
                    .resizable()
                    .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity, minHeight: 100, idealHeight: 200, maxHeight: 300)
                    .foregroundColor(.white)
                
            #endif
                
                //Label
                Text("\(employee.nombre)")
                    .padding()
                Text("\(employee.apell1)")
                    .padding()
                
                if let apell2 = employee.apell2 {
                    Text("\(apell2)")
                        .padding()
                }
                
                HStack{
                    Spacer()
                    Text("\(employee.edad)")
                        .padding()
                    Spacer()
                }
                Spacer()
            }
        }
        .background(.gray)
    }
}

#Preview {
    EmployeeDetailView(employee: Empleados(id: "046", nombre: "Pedro", apell1: "Liebana", apell2: "Castellano", idPhoto: "041", edad: 33))
}
