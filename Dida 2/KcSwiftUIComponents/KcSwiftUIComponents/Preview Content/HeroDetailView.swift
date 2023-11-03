//
//  HeroDetailView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct HeroDetailView: View {
    
    var data: Hero
    
    var body: some View {
        VStack{
            Text("Soy \(data.name)")
        }
        .navigationTitle("Hero Detail")
    }
}

#Preview {
    HeroDetailView(data: Hero(name: "Capitan America"))
}
