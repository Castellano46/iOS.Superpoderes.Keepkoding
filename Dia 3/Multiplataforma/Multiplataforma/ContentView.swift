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
        List{
            ForEach(Employees) { employee in
                EmpleadoRowView(employee: rh)
            }
        }
    }
}

#Preview {
    ContentView()
}
