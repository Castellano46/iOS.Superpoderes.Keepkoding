//
//  HerosModel.swift
//  kcHerosClase
//
//  Created by Pedro on 9/11/23.
//

import Foundation


struct Heros: Codable, Identifiable{
    var id: UUID
    var name: String
    var description: String
    var photo: String // Es una URL
    var favorite: Bool? // El usuario conecado, marca como favorito un héoe
    
    func getFullName() -> String {
        return "BB \(name)"
    }
}

// Para la request, necesito enviar el nombre del heroe.

struct HerosFilter: Codable {
    var name: String
}
