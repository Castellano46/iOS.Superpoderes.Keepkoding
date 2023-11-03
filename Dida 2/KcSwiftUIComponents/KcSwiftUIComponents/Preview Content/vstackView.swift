//
//  vstackView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct vstackView: View {
    var body: some View {
        VStack{
            Text("Hola")
            Spacer()
            Text("Keepcoders")
            Spacer()
            Text("Esto es SwiftUI")
                .font(.caption)
        }
        .font(.largeTitle)
        .frame(width: 300, height: 400)
        .background(Color.blue)
        .foregroundColor(.white)
        
    }
}

#Preview {
    vstackView()
}
