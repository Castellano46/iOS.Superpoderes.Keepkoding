/*
    URLSession. Descargar foto de internet
 
 */

import Foundation
import Combine
import UIKit

//para que funcione URLSession aqui...
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true



//Creamos un ViewModel

final class viewModelPhoto {
    //modelo
    var photo: UIImage?{
        didSet{
            print("Foto recibida OK")
            photo  //solo para depurar el playGround
        }
    }
    
    init(){
    }
    
    //Suscriptor
    var subscriber : AnyCancellable?
    
    //funcion De desacarga de una foto
    
    func DownloadImage(urlS: String)  {
        let url = URL(string: urlS)!
        
        subscriber = URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap{
                guard let httpResponse = $0.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200  else{
                    throw URLError(.badServerResponse)
                }
                return $0.data //devuelvo el dato de l respuesa... DATA
            }
            .map {
                UIImage(data: $0)
            }
            .receive(on: DispatchQueue.main) //al hilo principal
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error =>  \(error)")
                case .finished:
                    print("finaliza OK")
                }
            }, receiveValue: {
                if let foto = $0 {
                    self.photo = foto //foto
                }
            })
            
            
            
    }
}


//Testeamos!!!


let vm = viewModelPhoto()
vm.DownloadImage(urlS: "https://i.blogs.es/f7b0ed/steve-jobs/1366_2000.jpg")
vm.photo

