//
//  LoginView.swift
//  kcHerosClase
//
//  Created by Pedro on 9/11/23.
//

import SwiftUI

struct LoginView: View {
    // Coge la instancia del environment
    @EnvironmentObject var rootViewModel: RootViewModel
    
#if DEBUG
    @State private var email = "bejl@keepcoding.es"
    @State private var password = "123456"
#else
    @State private var email = ""
    @State private var password = ""
#endif
    
    var body: some View {
        ZStack{
            // Imagen de fondo
            Image(decorative: "backgroundLogin")
                .resizable()
                .opacity(1)
            
            // Capa oscurecer imagen
            Image(decorative: "")
                .resizable()
                .background(.black)
                .opacity(0.2)

            // Image(.logo)

            VStack{
                // Logo Dragon Ball
                Image(.title)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.8)
                    .padding(.top, 160)
                
                Spacer()

                // Usuario y clave
                VStack{
                   TextField("Usuario", text: $email)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(20)
                        .shadow(radius: 10.0, x:40, y:20)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .opacity(0.8)
                        .id(1) //for testing
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(20)
                        .shadow(radius: 10.0, x:40, y:20)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .opacity(0.8)
                        .padding(.top, 20)
                        .id(2) //for testing
                    
                    // Botón del login
                    Button(action: {
                        rootViewModel.login(user: email, password: password)
                    }, label: {
                        Text("Entrar")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(uiColor: UIColor(red: 221.0/255.0, green: 99.0/255.0, blue: 0.0, alpha: 1.0)))
                            .cornerRadius(20)
                            .shadow(radius: 10, x: 20, y:20)
                    })
                    .padding(.top, 50)
                    .opacity(0.8)
                    .id(3)
                }
                .padding([.leading, .trailing], 20)
                Spacer()
                
                // Link del registro
                HStack{
                    Text("¿No tienes cuenta?")
                        .foregroundStyle(.white)
                        .bold()
                    
                    Button(action: {
                        rootViewModel.status = .register
                    }, label: {
                        Text("Registro")
                            .foregroundStyle(.blue)
                    })
                }
                .padding(.bottom, 40)
            }
        }
        .ignoresSafeArea()
    }
}

//es, en (idiomas)
#Preview {
    LoginView()
        .environment(\.locale, .init(identifier: "en"))
        .preferredColorScheme(.light)
        .environmentObject(RootViewModel())
        //.environment(\.locale, .init(identifier: "en"))
}
