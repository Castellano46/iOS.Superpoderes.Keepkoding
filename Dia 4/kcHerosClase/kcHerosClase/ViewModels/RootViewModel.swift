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
    @Published var status = Status.none //estado
    var isLogged : Bool = false //indica si esta o no logado el usuario
    
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
            print("token login \(tokenJWT)")
        }
    }
    
    
    //combine
    var suscriptors = Set<AnyCancellable>()
    
    //inicializador
    init(){
        self.LogedUserControl() //control de su esta ya logado
    }
    
    ///Cierre de session
    func CloseSession(){
        tokenJWT = ""
        status = .none
    }
    
    //Control de usuario conectado.
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
    
    //Login al servidor
    func login(user:String , password: String){
        
        status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionLogin(user: user, password: password))
            .tryMap{
                //evaluamos si es 200, sino lo es Exception. Si es 200 pues devilvemos el JSON que es el data
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    //error
                    throw URLError(.badServerResponse)
                }
                
                //Todo OK. convierto Data -> Cadena usando codificacion utf8
                return String(decoding: $0.data, as: UTF8.self)
            }
            .receive(on: DispatchQueue.main) //hilo principal
            .sink { completion in
                //evakluacion la respuesta
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
    
}
