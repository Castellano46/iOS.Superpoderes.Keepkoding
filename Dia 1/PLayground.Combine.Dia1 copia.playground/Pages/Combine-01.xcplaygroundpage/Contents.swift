/*
    Publicadores.
 */

// Ejemplo 1. Array enteros.

import Combine

print("---------------------------------------------")
print("Ejercicio1. Array enteros. SINK")
print("---------------------------------------------")

let publisher1 = [1,2,3,4].publisher

publisher1.sink { data in
    //Aqui llega el dato al suscriptor
    print("Ejercicio1. llega dato... \(data)")
}



print("---------------------------------------------")
print("Ejercicio2. Array enteros. SINK y Completion")
print("---------------------------------------------")

publisher1.sink { completion in
    switch completion {
    case .failure(let error):
        //error
        print("Error \(error)")
    case .finished:
        //successs
        print("Ejecutado success")
    }
} receiveValue: { data in
    print("Ejercicio2. llega dato... \(data)")
}

publisher1.sink
