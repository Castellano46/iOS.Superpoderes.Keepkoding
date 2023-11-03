//
//  NavigationDataView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct Scores: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let published: Bool
}




struct NavigationDataView: View {
    
    var scores: [Scores] = [
        Scores(title: "Start wars", published: true),
        Scores(title: "The Empire stricks back", published: true),
        Scores(title: "Return of the Jedi", published: false)
    ]
    
    
    var body: some View {
        NavigationStack{
            
            NavigationLink(value: 1) {
                HStack{
                    Text("navega por Int")
                    
                }
            }
            
            List{
                ForEach(scores){ score in
                    NavigationLink(value: score) {
                        HStack{
                            Text(score.title)
                            Spacer()
                            Image(systemName: score.published ? "music.mic.circle.fill": "music.mic.circle")
                        }
                    }
                   
                }
            }
            .navigationTitle("Navegar por datos")
            .navigationDestination(for: Scores.self) { value in
                if value.published {
                    //true
                    Text("ya esta publicado")
                } else {
                    //false
                    Text("NO esta publicado")
                }
            }
            .navigationDestination(for: Int.self) { value in
                if value == 1{
                    //true
                    Text("Entero == 1")
                } else {
                    //false
                    Text("Entero != 1")
                }
            }
            
            
            NavigationLink(value: 0) {
                HStack{
                    Text("navega por Int == 0")
                    
                }
            }
            
        }
    }
}

#Preview {
    NavigationDataView()
}
