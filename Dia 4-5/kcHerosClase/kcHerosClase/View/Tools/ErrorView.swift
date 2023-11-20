//
//  ErrorView.swift
//  kcHerosClase
//
//  Created by Pedro on 9/11/23.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var rootViewModel: RootViewModel

    private var textError: String
    
    init(error: String){
        self.textError = error
    }
    
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 200, height: 200)
                .padding()
                .id(0)
            
            Text("\(textError)")
                .font(.title2)
                .foregroundStyle(.red)
                .bold()
                .padding()
                .id(1)
            
            Spacer()
            
            // Botón
            Button(action: {
                // Acción.
                rootViewModel.status = .none //volvemos al login
            }, label: {
                Text("Volver")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.orange)
                    .cornerRadius(20)
                    .shadow(radius: 10, x: 20, y: 10)
            })
            .id(2)
        }
    }
}

#Preview {
    ErrorView(error: "Esto es una prueba de error")
        .environmentObject(RootViewModel())
}
