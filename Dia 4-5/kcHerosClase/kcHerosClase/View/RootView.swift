//
//  RootView.swift
//  kcHerosClase
//
//  Created by Pedro on 7/11/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    
    var body: some View {
        //Status Box or ViewRouter
        switch rootViewModel.status{
        case Status.none:
            withAnimation {
                LoginView() //login
            }
        case .register:
                Text("Registro")
        case .loading:
            withAnimation {
                LoaderView()
            }
            
        case .error(error: let errorString):
            withAnimation {
                ErrorView(error: errorString)
            }
        case .loaded:
            withAnimation {
                PrincipalView() //la home de la app
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
