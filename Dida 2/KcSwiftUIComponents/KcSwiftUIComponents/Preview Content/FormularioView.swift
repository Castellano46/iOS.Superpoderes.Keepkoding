//
//  FormularioView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct FormularioView: View {
    
    @State var name: String = ""
    @State var apell1: String = ""
    @State var apell2: String = ""
    @State  var hasChildren: Bool = false
    private var categories = ["Programador", "Analista", "Full Stack"]
    @State var selectedCategory = "Analista"
    
    
    var body: some View {
        NavigationStack{
            Form(){
                Section {
                    // controles de formulario
                    TextField("Nombre", text: $name)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    TextField("Apellido1", text: $apell1)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    TextField("Apellido2", text: $apell2)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    
                } header: {
                    //nombre seccion
                    Text("Datos de empleado")
                }
                
                Section {
                    Toggle(isOn: $hasChildren) {
                    Text("Tienes hijos??")
                }
                } header: {
                    Text("Familia")
                }
                
                Section {
                    Picker(selection: $selectedCategory) {
                        ForEach(categories, id:\.self) {
                            Text($0)
                        }
                    } label: {
                        Text("Categoria del RH")
                    }
                    .pickerStyle(WheelPickerStyle())

                } header: {
                    Text("Datos laborales")
                }
                
                Section {
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Validar datos")
                            Spacer()
                        }
                    })
                    .foregroundColor(.white)
                }
                .listRowBackground(Color.orange)
            }
        }
    }
}

#Preview {
    FormularioView()
}
