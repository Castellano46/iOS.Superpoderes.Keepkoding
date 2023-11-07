//
//  Empleados.swift
//  Multiplataforma
//
//  Created by Pedro on 4/11/23.
//

import Foundation

struct Empleados: Identifiable {
    let id: String //PK
    let nombre: String
    let apell1: String
    let apell2: String?
    let idPhoto: String
    let edad: Int
}

func getTestData() -> [Empleados]{
    return [
        Empleados(id: "10010", nombre: "Pedro", apell1: "Liebana", apell2: "Castellano", idPhoto: "01", edad: 33),
        Empleados(id: "10011", nombre: "Mari", apell1: "Martinez", apell2: "Calahorro", idPhoto: "02", edad: 36),
        Empleados(id: "10012", nombre: "Gema", apell1: "Serrano", apell2: "Lopez", idPhoto: "03", edad: 32),
        Empleados(id: "10013", nombre: "Joju", apell1: "Campos", apell2: "Soto", idPhoto: "04", edad: 41),
        Empleados(id: "10014", nombre: "Manuel", apell1: "Moreno", apell2: "Camara", idPhoto: "05", edad: 52),
        Empleados(id: "10015", nombre: "Paco", apell1: "Lara", apell2: "Bermudez", idPhoto: "06", edad: 34),
        Empleados(id: "10016", nombre: "Antonio", apell1: "Moreno", apell2: "Camara", idPhoto: "07", edad: 37),
        Empleados(id: "10017", nombre: "Sara", apell1: "Martinez", apell2: "Serrano", idPhoto: "08", edad: 31),
    ]
}
