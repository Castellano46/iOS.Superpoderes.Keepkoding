//
//  ScrollContentView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct ScrollContentView: View {
    
    let colors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        ScrollViewReader { value in
            ScrollView{
                
                Button(action: {
                    
                    withAnimation{value.scrollTo(45)}
                    
                }, label: {
                    Text("Saltar al 45....")
                })
                
                ForEach(0..<100){ i in
                    Text("Example \(i)")
                        .font(.title)
                        .frame(width: 200, height: 200)
                        .background(colors[i % colors.count])
                        .id(i)
                }
                
                Button(action: {
                    
                    withAnimation{value.scrollTo(0)}
                    
                }, label: {
                    Text("Subir")
                })
            }
        }
    }
}

#Preview {
    ScrollContentView()
}
