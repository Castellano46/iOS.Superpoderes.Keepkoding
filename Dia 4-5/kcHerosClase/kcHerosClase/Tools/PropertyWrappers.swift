//
//  PropertyWrappers.swift
//  kcHerosClase
//
//  Created by Pedro on 9/11/23.
//

import Foundation

// Persistencia en keyChain
@propertyWrapper
class kcPersistenceKeyChain {
    private var key: String
    
    init(key: String) {
        self.key = key
    }
    
    var wrappedValue: String {
        // Leen tu propiedad
        get{
            if let value = loadKC(key: key){
                return value
            } else{
                return ""
            }
        }
        
        // Asignan valor.
        set{
            // Grabar
            saveKC(key: key, value: newValue)
        }
    }
}
