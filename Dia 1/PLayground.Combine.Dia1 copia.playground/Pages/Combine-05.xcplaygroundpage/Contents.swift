/*
 Notification center
 */

import Combine
import Foundation

//para que funcione NotificationCenter aqui...
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true



//Nuestra propia notificacion
extension Notification.Name{
    static let myNotification = Notification.Name("leroymerlin.com.empleados.notif1")
}


//creamos una propiedad de de mensaje, donde almacenamos los mensajes que llegan en notification center
var mensaje: String = "" {
    didSet {
        print("Nuevo valor :\(mensaje)")
    }
}


//me creo un publicador.
let publisher = NotificationCenter.default.publisher(for: .myNotification)
    .map{
        $0.object as? String //convierto a cadena el tipo Object
    }
    .replaceNil(with: "No llega nada")
    .replaceError(with: "Hay Error")
    .replaceEmpty(with: "Viene vacio")

var subscriber: AnyCancellable?

subscriber = publisher.sink(receiveValue: {
    mensaje = $0
})



//emito por notification center

let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
    //lo que quieres hacer cada 3 segundos....
    
    //NotificationCenter.default.post(name: .myNotification, object: "Mensaje \(Int.random(in: 1...50))")
    
    NotificationCenter.default.post(name: .myNotification, object: nil)
}
