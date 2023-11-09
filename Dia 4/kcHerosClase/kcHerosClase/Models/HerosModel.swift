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
    var photo: String //es una URL
    var favorite: Bool? //el usuario conecado, marca como favorito un heroes
}

//para la request, necesito enviar el nombre del heroe.

struct HerosFilter: Codable {
    var name: String
}
