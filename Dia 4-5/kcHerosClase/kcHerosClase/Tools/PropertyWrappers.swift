//
//  PropertyWrappers.swift
//  kcHerosClase
//
//  Created by Pedro on 9/11/23.
//

import Foundation

//persistencia en keyChain

@propertyWrapper
class kcPersistenceKeyChain {
    private var key: String
    
    init(key: String) {
        self.key = key
    }
    
    var wrappedValue: String {
        //leen tu propiedad
        get{
            if let value = loadKC(key: key){
                return value
            } else{
                return ""
            }
        }
        
        //te asignan valor.
        set{
            //Grabar
            saveKC(key: key, value: newValue)
        }
    }
}
