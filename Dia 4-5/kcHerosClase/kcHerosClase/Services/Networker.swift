//
//  Networker.swift
//  kcHerosClase
//
//  Created by Pedro on 13/11/23.
//

import Foundation
import Combine

//llamadas de red con genericos + Combine

protocol NetworkerProtocol: AnyObject {
    func callServer<T>(type: T.Type, request: URLRequest) -> AnyPublisher< T, Error> where T: Decodable
}

final class NetWorker: NetworkerProtocol {
    func callServer<T>(type: T.Type, request: URLRequest) -> AnyPublisher<T, Error> where T : Decodable {
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
    
    
}
