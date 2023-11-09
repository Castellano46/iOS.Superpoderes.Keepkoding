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
                Text("Lista heroes")
                Button(action: {
                    rootViewModel.CloseSession()
                }, label: {
                    Text("Cerrar session")
                })
            }
            .tabItem {
                Image(systemName: "house")
                Text("Heroes")
            }
        }
    }
}

#Preview {
    PrincipalView()
        .environmentObject(RootViewModel())
}
