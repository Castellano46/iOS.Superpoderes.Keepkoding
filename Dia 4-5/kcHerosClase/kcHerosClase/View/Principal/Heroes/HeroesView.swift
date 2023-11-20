//
//  HeroesView.swift
//  kcHerosClase
//
//  Created by Pedro on 9/11/23.
//

import SwiftUI

struct HeroesView: View {
   @StateObject var viewModel: viewModelHeros
   @State private var filter: String = ""
    @EnvironmentObject var viewModelRoot: RootViewModel
    
    var body: some View {
        NavigationStack {
            List{
                if let heros = viewModel.heros{
                    ForEach(heros){ data in
                        NavigationLink {
                            //Destino
                            HeroesDetailView(hero: data)
                        } label: {
                            // Celda personalizada
                            HeroesRowView(hero: data)
                                .frame(height: 200)
                        }
                    }
                }
            }
            .navigationTitle("Heros")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Close session
                        viewModelRoot.CloseSession()
                    }, label: {
                        HStack{
                            Image(systemName: "xmark.circle")
                            Text("close")
                                .font(.caption2)
                        }
                    })
                }
            }
        }
        .searchable(text: $filter,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Buscar Heroes...")
        .onChange(of: filter) { oldValue, newValue in
            // Ha cambiado el filtro de búsqueda
            viewModel.getHeros(filter: newValue)
        }
    }
}

#Preview {
    HeroesView(viewModel: viewModelHeros(testing: true))
}
