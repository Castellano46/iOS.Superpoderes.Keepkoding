//
//  ModalView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct ModalView: View {
    
    @State var showDetail = false
    
    var body: some View {
        Button(action: {
            //action here
            showDetail.toggle()
        }, label: {
            Text("show modal")
        })
        .sheet(isPresented: $showDetail, content: {
            DetailModalView(showDetail: $showDetail)
        })
    }
}

#Preview {
    ModalView()
}
