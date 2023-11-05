//
//  hvstacks.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct hvstacks: View {
    var body: some View {
        VStack{
            HStack{
                Text("Mi nombre es:")
                Text("Pedro")
            }
            HStack{
                Text("Mi nombre es:")
                Text("MAri")
                }
            }
        }
    }


#Preview {
    hvstacks()
}
