import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


//modelo de bootcamps
struct BootCamps: Codable {
    let id: UUID
    let name: String
}

//Definimos los typeAlias
typealias successClosure = ([BootCamps])->Void
typealias errorClosure = (() -> Void)?

//extension de URLResponse
extension URLResponse {
    func getStatudCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}


final class testLoad{
    func loadBootCamps(onSuccess: @escaping successClosure, onError: errorClosure) -> Void{
        let url = URL(string: "https://dragonball.keepcoding.education/api/data/bootcamps")
        var request : URLRequest = URLRequest(url: url!)
        request.httpMethod  = "GET"
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            
            //aqui ha terminado la llamada
            if error != nil {
                onError!() //OJO!!!!!! desempaquetar aqui....
                return
            }
            
            //evaluar respuesta
            if (response?.getStatudCode() == 200){
                do{
                    if let datos = data {
                        //decode
                        let model = try JSONDecoder().decode([BootCamps].self, from: datos)
                        
                        //enviamos
                        onSuccess(model)
                        
                    } else{
                        //No vienen datos
                        onError!()
                    }
                    
                } catch{
                    onError!()
                }
                
            } else {
                //Error
                onError!()
            }
        }
        
        task.resume()
    }
}



//la llamada a la funcion de la clase...

let obj = testLoad()

obj.loadBootCamps { data in
    //success
    DispatchQueue.main.async {
      print("cargados lo sbootcamps")
        data.forEach{ bootcamp in
            print("\(bootcamp.id) - \(bootcamp.name)")
        }
    }
    
} onError: {
    //error
    DispatchQueue.main.async {
        print("error")
    }
}
