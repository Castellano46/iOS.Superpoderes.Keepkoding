//
//  ContentView.swift
//  Multiplataforma
//
//  Created by Pedro on 4/11/23.
//

import SwiftUI

struct ContentView: View {
    
    private var Employees = getTestData()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(Employees){rh in
                    NavigationLink {
                        //destionation
                        EmployeeDetailView(employee: rh)
                    } label: {
                        EmpleadoRowView(employee: rh)
                    }
                }
            }
            .navigationTitle("Empleados")
        }
    }
}

#Preview {
    ContentView()
}
