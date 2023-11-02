import Combine
import UIKit
/*
    Publicadores tipo Subjects
 */

print("---------------------------------")
print("Ejercicio1- Subject Valor actual")
print("---------------------------------")

let subject = CurrentValueSubject<Int, Never>(0) //inicializado a cero

subject.value  //ver el valor.
subject.send(1) //envio 1 por el publicador
subject.send(2) //envio 1 por el publicador
subject.value

//creamos un suscriptor.
let suscriber = subject.sink {
    print("Ejericio1 recibo valor: \($0)")
}

//emitir mas valor.
subject.send(11) //envio 1 por el publicador
subject.send(22) //envio 1 por el publicador

//finalizar la emision con success o error
subject.send(completion: .finished)


subject.send(33)



//sin valor actual....

enum myError: Error {
    case errorRed
    case errorMaximo
}



let publisher2 = PassthroughSubject<Int, Never>()

let suscriber2 = publisher2.sink { data in
    print("Ejericio2-1 recibo valor: \(data)")
}

let suscriber3 = publisher2.sink { data in
    print("Ejericio2-2 recibo valor: \(data)")
}

publisher2.send(1)
publisher2.send(2)
publisher2.send(3)
