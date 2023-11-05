//
//  hstackView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct hstackView: View {
    var body: some View {
        HStack{
            Text("Mi nombre es:")
                .bold()
            Text("Steve Jobs")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.blue)
        }
        //.padding()
        .frame(width: 300, height: 150)
        .background(Color.yellow)
        .cornerRadius(25)
    }
}

#Preview {
    hstackView()
}
