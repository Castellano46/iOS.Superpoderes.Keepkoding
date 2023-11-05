//
//  TableView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct TabContentView: View {
    var body: some View {
        TabView{
            imageView()
                .tabItem {
                    Image(systemName: "star")
                    Text("imagen")
                }
            
            ButtomView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Botones")
                }
        }
    }
}

#Preview {
    TabContentView()
}
