//
//  DevelopersView.swift
//  kcHerosClase
//
//  Created by Pedro on 10/11/23.
//

import SwiftUI

struct DevelopersView: View {
    @StateObject var viewModel: ViewModelDevelopers
    @EnvironmentObject var viewModelRoot: RootViewModel
    
    var body: some View {
        ScrollView{
            if let boots = viewModelRoot.bootcamps,
               let devs = viewModel.developers{
                
                ForEach(boots){ boot in
                    // Filtrar por developers de bootcamp
                    let devsBoot = devs.filter({$0.bootcamp.id == boot.id})
                    
                    if devsBoot.count > 0 {
                        VStack(alignment: .leading){
                            // Título
                            Text(boot.name)
                                .font(.title)
                                .foregroundStyle(.orange)
                                .bold()
                            
                            // Lista tipo netflix
                            ScrollView(.horizontal, showsIndicators: false){
                                LazyHStack{
                                    ForEach(devsBoot){ dataRow in
                                        
                                        let _ = print("\(dataRow.id)")
                                        
                                        // subView
                                        VStack{
                                            // Foto
                                            AsyncImage(url: URL(string: dataRow.photo)) { photo in
                                                
                                                photo
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(50)
                                                    .padding()
                                            } placeholder: {
                                                // Place holder
                                                Image(systemName: "person")
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .padding()
                                            }

                                            // Nombre
                                            Text("\(dataRow.name)")
                                        }
                                        .onTapGesture(count: 2) {
                                            let _ = print("\(dataRow.name)")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                Text("NO hay datos")
            }
        }
    }
}

 #Preview {
 DevelopersView(viewModel: ViewModelDevelopers(testing: true, boots: RootViewModel(testing: true).bootcamps!))
 .environmentObject(RootViewModel(testing: true))
 }
