//
//  ButtomView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct ButtomView: View {
    
    @State var imageChange = false
    
    
    var body: some View {
        VStack{
            
            switch imageChange{
            case true:
                Image(systemName: "sun.max")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 200, height: 200)
                    .padding()
                
            case false:
                Image(systemName: "cloud.drizzle")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 200)
                    .padding()
            }
            
            Button(action: {
                //action here
                imageChange.toggle()
                
            }, label: {
                Text("Cambia el tiempo")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                //.cornerRadius(20) hasta iOS15 despues para hacer corner radius se hace como debajo
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            })
        }
    }
}

#Preview {
    ButtomView()
}
