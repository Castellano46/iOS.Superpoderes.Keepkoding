/*
    
 Suscriptores.. Almacenamos el suscriptor.
 
 */

 

// Ejercicio 1. Alamcenamos suscriptor en una constante
 
 import Combine
 
 let publisher1 = [1,2,3,4].publisher
 
 
 print("---------------------------------------------")
 print("Ejercicio1. Guardamos el suscriptor")
 print("---------------------------------------------")
 
 
 let suscriptor2 : AnyCancellable?
 
 suscriptor2 = publisher1.sink { data in
 print("Ejercicio1: recibo \(data)")
 }
 /*
  let suscriptor1 = publisher1.sink { data in
  print("Ejerc1: recibo \(data)")
  }
  */
 //suscriptor1.cancel() //Cancelo suscriptor
 
 
 
 print("---------------------------------------------")
 print("Ejercicio2. Guardamos el suscriptor STORE")
 print("---------------------------------------------")
 
 var suscriptor3 = Set<AnyCancellable>()
 
 publisher1.sink { data in
 print("Ejercicio2-1: recibo \(data)")
 }
 .store(in: &suscriptor3)
 
 /*
  publisher1.sink { data in
  print("Ejerc2-2: recibo \(data)")
  }
  .store(in: &suscriptor3)
  */
 
 
 
 
 print("---------------------------------------------")
 print("Ejercicio3. ¿Como lo hacemos en un ViewModel?")
 print("---------------------------------------------")
 
 class viewModel {
 var valor: String = "" {
 didSet {
 print("Ejercicio3- Valor asignado: \(valor)")
 }
 }
 
 //Definir un publicador
 var publisher = ["Hola", "Keepcoders"].publisher
 
 //set de suscriptores
 var suscribers = Set<AnyCancellable>()
 
 init(){
 
 publisher
 .sink { data in
 //el suscriptor, recibe el valor del publicador.
 self.valor = data //asigno el valor.
 }
 .store(in: &suscribers)
 
 /*
  publisher
  .assign(to: \.valor, on: self) //mi clase la propiedad valor.
  .store(in: &suscribers)
  */
 }
 
 }
 
 //lanzo
 let vm = viewModel()
 
 
