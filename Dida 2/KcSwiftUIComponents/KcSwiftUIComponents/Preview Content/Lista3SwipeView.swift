//
//  Lista3SwipeView.swift
//  KcSwiftUIComponents
//
//  Created by Pedro on 3/11/23.
//

import SwiftUI

struct Lista3SwipeView: View {
    
    @State private var bestFriends = ["Juan", "Pedro", "Luis"]
    var body: some View {
        NavigationStack{
            List{
                ForEach(bestFriends, id:\.self){ friend in
                    Text(friend)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true){
                            //accion1
                            Button(action: {
                                //accion aqui
                                
                            }, label: {
                                Label("Silenciar", systemImage: "bell.fill")
                            })
                            .tint(.red)
                            
                            //accion2
                            Button(action: {
                                //accion aqui
                                
                            }, label: {
                                Label("Video", systemImage: "video.fill")
                            })
                            .tint(.green)
                        }
                            
                        .swipeActions(edge: .trailing, allowsFullSwipe: true){
                            //accion1
                            Button(action: {
                                //accion aqui
                                
                            }, label: {
                                Label("Llamar", systemImage: "phone")
                            })
                            .tint(.gray)
                        }
                    }
                }
            .refreshable {
                //pooltorefresh
                bestFriends.append("new")
            }
            .navigationTitle("Amigos")
        }
    }
}

#Preview {
    Lista3SwipeView()
}
