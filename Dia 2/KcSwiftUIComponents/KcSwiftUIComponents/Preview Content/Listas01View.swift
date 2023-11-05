//
//  Listas01View.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct Listas01View: View {
        
        let heros = ["Thor", "Spiderman", "Capitan America"]
    
        @State var heroSelected: String = "" // guardo el heroe seleccionado
        @State private var showAlert = false // para que sarte el alert
        
        var body: some View {
            List{
                ForEach(heros, id: \.self){ data in
                    //pinto lo que quiero que sea la celda
                    
                    Button(action: {
                        heroSelected = data // guardo el heroe
                        showAlert = true
                    }, label: {
                        Text(data)
                    })
                }
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("El heroe seleccionado es \(heroSelected)"))
            })
        
        /*
        List {
            Text("Thor")
            Text("Spiderman")
            Text("Capi")
        }
         */
    }
}

#Preview {
    Listas01View()
}
