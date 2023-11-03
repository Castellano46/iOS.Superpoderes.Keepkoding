//
//  zstackView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct zstackView: View {
    var body: some View {
        ZStack{
            //IMAGEN linterna verde
            Image(decorative: "linterna")
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(20)
            
            //Capa oscura transparente
            Image(decorative: "")
                .resizable()
                .background(.black)
                .frame(width: 200, height: 200)
                .cornerRadius(20)
                .opacity(0.3)
            
            
            Text("Linterna Verde")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    zstackView()
}
