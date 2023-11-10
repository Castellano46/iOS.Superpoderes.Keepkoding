//
//  PrincipalView.swift
//  kcHerosClase
//
//  Created by Pedro on 9/11/23.
//

import SwiftUI

struct PrincipalView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
       TabView{
           
            VStack{
                HeroesView(viewModel: viewModelHeros())
            }
            .tabItem {
                Image(systemName: "house")
                Text("Heroes")
            }
           
           DevelopersView(viewModel: ViewModelDevelopers())
               .tabItem {
                   Image(systemName: "person")
                   Text("Developer")
            }
        }
    }
}

#Preview {
    PrincipalView()
        .environmentObject(RootViewModel())
}
