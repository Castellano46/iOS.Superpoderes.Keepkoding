//
//  Lista2View.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

// Modelo Hero
struct Hero: Identifiable {
    let id: UUID = UUID()
    let name: String
}

struct Lista2View: View {
    
    let heros = [
        Hero(name: "Thor"),
        Hero(name: "Spiderman"),
        Hero(name: "Capitan America")
    ]
    
    var body: some View {
        NavigationView{
        
            List{
                ForEach(heros) { hero in
                    
                    NavigationLink {
                        //Vista destino
                        VStack{
                            Text("Detalle de \(hero.name)")
                        }
                        
                    } label: {
                        //Celda
                        HStack{
                            Image(systemName: "person")
                            Text(hero.name)
                        }
                    }
                }
            }
            .navigationTitle("Heroes")
        }
    }
}

#Preview {
    Lista2View()
}
