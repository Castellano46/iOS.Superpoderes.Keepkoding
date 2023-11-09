//
//  BaseNetwork.swift
//  kcHerosClase
//
//  Created by Pedro on 7/11/23.
//

import Foundation

//constantes.
let server = "https://dragonball.keepcoding.education"

//structs de metodos de red

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    
    static let content = "application/json"
}

enum endpoints: String {
    case login = "/api/auth/login"
    case herosList = "/api/heros/all"
}


struct BaseNetwork {
    
    //monta la request del login
    func getSessionLogin(user: String, password: String) -> URLRequest {
        let urlCad = "\(server)\(endpoints.login.rawValue)"
        let encodeCredentials = "\(user):\(password)".data(using: .utf8)?.base64EncodedString()
        
        var sefCredential = ""
        if let credentials = encodeCredentials {
            sefCredential = "Basic \(credentials)"
        }
        
        //Creamos la request
        var request: URLRequest = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.post
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        request.addValue(sefCredential, forHTTPHeaderField: "Authorization")
        
        return request
        
    }
    
    //montamos el request de heroes
    func getSessionHero(filter: String) -> URLRequest{
        let urlCad = "\(server)\(endpoints.herosList.rawValue)"
        
        var request: URLRequest = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.post
        
        //generamos el JSON y lo metemos en el body de la llamada
        request.httpBody = try? JSONEncoder().encode(HerosFilter(name: filter))
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        
        //seguridad JWT
        let tokenOptional = loadKC(key: CONST_TOKEN_ID)
        if let tokenJWT = tokenOptional {
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
    
}
