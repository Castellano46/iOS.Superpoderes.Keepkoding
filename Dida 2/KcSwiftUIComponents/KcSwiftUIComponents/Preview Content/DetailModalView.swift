//
//  DetailModalView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct DetailModalView: View {
    
    @Binding var showDetail: Bool
    @Environment(\.presentationMode) private var presentationMode
    
    
    
    var body: some View {
        VStack{
            Text("Soy el modal....")
            
            Button(action: {
                //showDetail.toggle()
                
                presentationMode.wrappedValue.dismiss()
                
            }, label: {
                Text("Cerrar el modal")
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(20)
            })
        }
    }
}

