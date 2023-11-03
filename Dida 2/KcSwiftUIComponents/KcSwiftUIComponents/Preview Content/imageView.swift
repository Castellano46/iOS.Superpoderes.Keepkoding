//
//  imageView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct imageView: View {
    var body: some View {
        VStack{
            Image(systemName: "house")
                .resizable()
                .frame(width: 200, height: 200)
            
            Divider()
            
            AsyncImage(url: URL(string: "https://i.blogs.es/f7b0ed/steve-jobs/1366_2000.jpg")) { Image in
                
                Image
                    .resizable()
                
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(4)
            }
            .frame(width: 200, height: 200)
            
            Divider()
            
            Image(decorative: "linterna")
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(20)
        }
    }
}

#Preview {
    imageView()
}
