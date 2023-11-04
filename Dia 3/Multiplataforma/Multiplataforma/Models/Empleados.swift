//
//  Empleados.swift
//  Multiplataforma
//
//  Created by Pedro on 4/11/23.
//

import Foundation

struct Empleados: Identifiable {
    let id: String
    let nombre: String
    let apell1: String
    let apell2: String
    let idPhoto: String
    let edad: Int
}

func getTestData() -> [Empleados]{
    return [
        Empleados(id: "10010", nombre: "Juan", apell1: "Lopez", apell2: "Marin", idPhoto: "01", edad: 43),
        Empleados(id: "14310", nombre: "Maria", apell1: "Gutierrez", apell2: "Soto", idPhoto: "24", edad: 53),
        Empleados(id: "10013", nombre: "Jose", apell1: "Lopez", apell2: "Marin", idPhoto: "54", edad: 23),
        Empleados(id: "10014", nombre: "Sandra", apell1: "Castellano", apell2: "Marin", idPhoto: "23", edad: 32),
        Empleados(id: "10015", nombre: "Manuel", apell1: "lopez", apell2: "Marin", idPhoto: "22", edad: 42),
        Empleados(id: "10016", nombre: "Pedro", apell1: "Lopez", apell2: "Marin", idPhoto: "76", edad: 33)
    ]
}
