//
//  LoaderView.swift
//  kcHerosClase
//
//  Created by Pedro on 9/11/23.
//

import SwiftUI

struct LoaderView: View {
        
    var body: some View {
  
        Image(systemName: "clock")
            .resizable()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        
        Text("Por favor espere...")
            .font(.title)
            .padding(.top, 50)
    }
}

#Preview {
    LoaderView()
}
