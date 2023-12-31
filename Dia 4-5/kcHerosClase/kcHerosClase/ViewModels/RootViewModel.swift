//
//  RootViewModel.swift
//  kcHerosClase
//
//  Created by Pedro on 7/11/23.
//

import Foundation
import Combine

public let CONST_TOKEN_ID = "TokenJWTAppiOSBoot17"


final class RootViewModel: ObservableObject {
    @Published var status = Status.none // Estado
    var isLogged : Bool = false // Indica si está o no logado el usuario
    
    @Published var bootcamps: [Bootcamp]? // Bootcamps de keepcoding
    
    //token de login
    /*
    @Published var tokenJWT: String = "" {
        didSet{
            print("llega login: \(tokenJWT)")
            //guardar en el KeyChain
            saveKC(key: CONST_TOKEN_ID, value: tokenJWT)
            
            if tokenJWT.count > 0 {
                isLogged = true
            } else{
                isLogged = false
            }
        }
    }
     */
    
    @kcPersistenceKeyChain(key: CONST_TOKEN_ID)
    var tokenJWT{
        didSet{
           // print("token login \(tokenJWT)")
        }
    }
    
    // Combine
    var suscriptors = Set<AnyCancellable>()
    
    init(testing: Bool = false){
        self.LogedUserControl() // Control para saber si esta logado
        
        // Cargamos los bootcamos si estamos en modo testing o diseño
        if(!testing){
            self.loadBootcamps()
        } else {
            loadBootcampsTesting() //Design mode
        }
    }
    
    // Cierre de sesión
    func CloseSession(){
        tokenJWT = ""
        status = .none
    }
    
    // Control de usuario conectado.
    func LogedUserControl(){
      /*
        let tokenOptional = loadKC(key: CONST_TOKEN_ID) //LEEMOS EL TOJKEN del KeyChain
        
        if let token = tokenOptional {
            tokenJWT = token //asigno el token guardado
            status = .loaded
        }
       
       */
        
        if tokenJWT != ""{
            status = .loaded
        }
    }
    
    // Login al servidor
    func login(user:String , password: String){
        
        status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionLogin(user: user, password: password))
            .tryMap{
                // Evaluamos si es 200, sino lo es Exception. Si es 200 devolvemos el JSON que es data
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    // Error
                    throw URLError(.badServerResponse)
                }
                
                // Todo OK. convierto Data -> Cadena usando codificacion utf8
                return String(decoding: $0.data, as: UTF8.self)
            }
            .receive(on: DispatchQueue.main) // Hilo principal
            .sink { completion in
                // Evaluación de la respuesta
                switch completion{
                case .failure:
                    self.status = .error(error: "Usuario y/o clave erronea") //LogiN Error
                case .finished:
                    self.status = .loaded //Login OK
                }
            } receiveValue: { token in
                self.tokenJWT = token
            }
            .store(in: &suscriptors)
    }
    
    func loadBootcamps(){
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionBootCamps())
            .tryMap{
                // Evaluamos si es 200, sino lo es Exception. Si es 200 devolvemos el JSON que es data
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    // Error
                    throw URLError(.badServerResponse)
                }
                
                // Todo OK. Devuelvo Data
                return $0.data
            }
            .decode(type: [Bootcamp].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = .error(error: "Error buscando bootcamps")
                case .finished:
                    self.status = .loaded // Success
                }
            } receiveValue: { data in
                self.bootcamps = data
            }
            .store(in: &suscriptors)
    }
        
    // Disñeo UI
    func loadBootcampsTesting(){
        let b1 = Bootcamp(id: "01", name: "boot Mobile 1")
        let b2 = Bootcamp(id: "02", name: "boot Mobile 2")
        let b3 = Bootcamp(id: "03", name: "boot Mobile 3")
        let b4 = Bootcamp(id: "04", name: "boot Mobile 4")
        
        self.bootcamps = [b1, b2, b3, b4]
    }
}
