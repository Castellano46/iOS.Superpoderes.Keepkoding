//
//  navigationView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct navigationView: View {
    
    let heros = [
        Hero(name: "Thor"),
        Hero(name: "Spiderman"),
        Hero(name: "Capitan America")
    ]
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(heros) { hero in
                    NavigationLink {
                        HeroDetailView(data: hero)
                        
                    }label: {
                        HStack{
                            Image(systemName: "person")
                            Text(hero.name)
                        }
                    }
                }
            }
            .navigationTitle("Heros")
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    Button("Filtrar datos"){}
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Filtrar datos"){}
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Filtrar datos"){}
                }
            }
            
        }
    }
}

#Preview {
    navigationView()
}
