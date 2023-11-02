/*
    KVO. OIbservadores de propiedad
 */

// Ejemplo de observador de propiedad sencillo con Swift

import Foundation


var name = "" {
    willSet{
        print("nuevo valor fututo -> \(newValue)")
    }
    
    didSet{
        print("nuevo valor asignado -> \(name)")
    }
}

name = "Pedro"



// KVO en OBJ-C. Observador fuera de la propiedad

@objc class Person: NSObject{
    @objc dynamic var name = "Taylor Swift"
}

let taylor = Person()

//creaamos el observador

taylor.observe(\Person.name, options: .new){person, change in
    print("Ahora cambia el nombre a... \(person.name)")
}

taylor.name = "Jose"
taylor.name = "Maria"

