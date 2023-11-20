//
//  KeyChain.swift
//  kcHerosClase
//
//  Created by Pedro on 7/11/23.
//

import KeychainSwift

//guardamos

@discardableResult
func saveKC(key: String , value:String) -> Bool {
    //conviertiendo cadena value en data con codificacion utf8
    if let data = value.data(using: .utf8){
        return KeychainSwift().set(data, forKey: key)
    } else {
        //no desempaqueta...
        return false
    }
}

//Leemos del keychain
func loadKC(key: String) -> String? {
    if let data = KeychainSwift().get(key){
        return data
    } else{
        return ""
    }
}

//Borramos
func deleteKC(key: String) -> Bool{
    KeychainSwift().delete(key)
}
